class MorphemesController < InheritedResources::Base
  skip_before_filter :authenticate_user!
  layout "dku"

  def index
    @morphemes = Morpheme.order("created_at DESC").page(params[:page]).per(5)
    natto = Natto::MeCab.new(dicdir: "/data/mecab/lib/mecab/dic/mecab-ko-dic/")
    if @morphemes.present?
      @text_all = natto.enum_parse(Morpheme.last.input)
      tags = ["NNG", "NNP", "NR", "VA", "MAG", "VV"]
      @graph = @text_all.group_by {|t| (t.surface if tags.include? t.feature.split(",").first) }
                                .tap { |hs| hs.delete(nil) }
                                .map {|k,v| [k, v.length]}.sort { |a,b| a[1] <=> b[1]}
                                .reverse[0..9]
      @morphemes_aggregate = @text_all.group_by {|t| (t.feature.split(",").first if tags.include? t.feature.split(",").first) }
                                .tap { |hs| hs.delete(nil) }
                                .map {|k,v| [Morpheme::CODES[k], v.length]}.sort { |a,b| a[1] <=> b[1]}
                                .reverse[0..9]
      @text = Kaminari.paginate_array(@text_all.to_a).page(params[:page_table]).per(23)
    end
    gon.graph = @graph
    @morpheme = Morpheme.new
  end

  def create
    @morpheme = Morpheme.create(morpheme_params)
    redirect_to morphemes_path
  end

  private
    def morpheme_params
      params.require(:morpheme).permit(:input)
    end
end
