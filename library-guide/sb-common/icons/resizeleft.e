expanded class RESIZELEFT

feature

   width: INTEGER is 32
   height: INTEGER is 32
   x_hot: INTEGER is 12
   y_hot: INTEGER is 12
   bits: STRING is
   "%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/128/%/000/%/002/%/000/%
   %%/192/%/000/%/006/%/000/%/160/%/255/%/011/%/000/%/016/%/000/%/016/%/000/%
   %%/008/%/000/%/032/%/000/%/016/%/000/%/016/%/000/%/160/%/255/%/011/%/000/%
   %%/192/%/000/%/006/%/000/%/128/%/000/%/002/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/128/%/001/%/003/%/000/%/192/%/001/%/007/%/000/%/224/%/255/%/015/%/000/%
   %%/240/%/255/%/031/%/000/%/248/%/255/%/063/%/000/%/252/%/255/%/127/%/000/%
   %%/248/%/255/%/063/%/000/%/240/%/255/%/031/%/000/%/224/%/255/%/015/%/000/%
   %%/192/%/001/%/007/%/000/%/128/%/001/%/003/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/016/%/000/%/000/%/000/%/040/%/000/%/000/%/000/%/068/%/000/%/000/%
   %%/000/%/130/%/000/%/000/%/000/%/199/%/001/%/000/%/000/%/068/%/000/%/000/%
   %%/000/%/068/%/000/%/000/%/000/%/068/%/000/%/000/%/000/%/068/%/000/%/000/%
   %%/000/%/068/%/000/%/000/%/000/%/068/%/000/%/000/%/000/%/068/%/000/%/000/%
   %%/000/%/068/%/000/%/000/%/000/%/068/%/000/%/000/%/000/%/199/%/001/%/000/%
   %%/000/%/130/%/000/%/000/%/000/%/068/%/000/%/000/%/000/%/040/%/000/%/000/%
   %%/000/%/016/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/016/%/000/%/000/%/000/%/056/%/000/%/000/%
   %%/000/%/124/%/000/%/000/%/000/%/254/%/000/%/000/%/000/%/255/%/001/%/000/%
   %%/128/%/255/%/003/%/000/%/128/%/255/%/003/%/000/%/000/%/254/%/000/%/000/%
   %%/000/%/254/%/000/%/000/%/000/%/254/%/000/%/000/%/000/%/254/%/000/%/000/%
   %%/000/%/254/%/000/%/000/%/000/%/254/%/000/%/000/%/000/%/254/%/000/%/000/%
   %%/128/%/255/%/003/%/000/%/128/%/255/%/003/%/000/%/000/%/255/%/001/%/000/%
   %%/000/%/254/%/000/%/000/%/000/%/124/%/000/%/000/%/000/%/056/%/000/%/000/%
   %%/000/%/016/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/224/%/007/%/000/%/000/%/032/%/002/%/000/%/000/%
   %%/032/%/004/%/000/%/000/%/032/%/008/%/000/%/000/%/096/%/016/%/000/%/000/%
   %%/160/%/032/%/000/%/000/%/000/%/065/%/000/%/000/%/000/%/130/%/000/%/000/%
   %%/000/%/004/%/005/%/000/%/000/%/008/%/006/%/000/%/000/%/016/%/004/%/000/%
   %%/000/%/032/%/004/%/000/%/000/%/064/%/004/%/000/%/000/%/224/%/007/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/240/%/015/%/000/%/000/%
   %%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%
   %%/240/%/031/%/000/%/000/%/240/%/063/%/000/%/000/%/240/%/127/%/000/%/000/%
   %%/240/%/255/%/000/%/000/%/000/%/255/%/015/%/000/%/000/%/254/%/015/%/000/%
   %%/000/%/252/%/015/%/000/%/000/%/248/%/015/%/000/%/000/%/240/%/015/%/000/%
   %%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/224/%/007/%/000/%
   %%/000/%/064/%/004/%/000/%/000/%/032/%/004/%/000/%/000/%/016/%/004/%/000/%
   %%/000/%/008/%/006/%/000/%/000/%/004/%/005/%/000/%/000/%/130/%/000/%/000/%
   %%/000/%/065/%/000/%/000/%/160/%/032/%/000/%/000/%/096/%/016/%/000/%/000/%
   %%/032/%/008/%/000/%/000/%/032/%/004/%/000/%/000/%/032/%/002/%/000/%/000/%
   %%/224/%/007/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%
   %%/000/%/240/%/015/%/000/%/000/%/248/%/015/%/000/%/000/%/252/%/015/%/000/%
   %%/000/%/254/%/015/%/000/%/000/%/255/%/015/%/000/%/240/%/255/%/000/%/000/%
   %%/240/%/127/%/000/%/000/%/240/%/063/%/000/%/000/%/240/%/031/%/000/%/000/%
   %%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%/240/%/015/%/000/%/000/%
   %%/240/%/015/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/";
end