expanded class DONTDROP_MASK

feature

   width: INTEGER = 32
   height: INTEGER = 32
   x_hot: INTEGER = 11
   y_hot: INTEGER = 12
   bits: STRING =
   "%/000/%/000/%/000/%/000/%/000/%/127/%/000/%/000/%/192/%/255/%/001/%/000/%
   %%/240/%/255/%/007/%/000/%/248/%/255/%/015/%/000/%/252/%/255/%/031/%/000/%
   %%/252/%/255/%/031/%/000/%/254/%/255/%/063/%/000/%/254/%/255/%/063/%/000/%
   %%/255/%/255/%/127/%/000/%/255/%/255/%/127/%/000/%/255/%/255/%/127/%/000/%
   %%/255/%/255/%/127/%/000/%/255/%/255/%/127/%/000/%/255/%/255/%/127/%/000/%
   %%/255/%/255/%/127/%/000/%/254/%/255/%/063/%/000/%/254/%/255/%/063/%/000/%
   %%/252/%/255/%/031/%/000/%/252/%/255/%/031/%/000/%/248/%/255/%/015/%/000/%
   %%/240/%/255/%/007/%/000/%/192/%/255/%/001/%/000/%/000/%/127/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/032/%/000/%/000/%/000/%/080/%/000/%/000/%/000/%/136/%/000/%/000/%
   %%/000/%/004/%/001/%/000/%/000/%/142/%/003/%/000/%/000/%/136/%/000/%/000/%
   %%/000/%/136/%/000/%/000/%/000/%/136/%/000/%/000/%/032/%/136/%/032/%/000/%
   %%/048/%/136/%/096/%/000/%/232/%/143/%/191/%/000/%/004/%/000/%/000/%/001/%
   %%/002/%/000/%/000/%/002/%/004/%/000/%/000/%/001/%/232/%/143/%/191/%/000/%
   %%/048/%/136/%/096/%/000/%/032/%/136/%/032/%/000/%/000/%/136/%/000/%/000/%
   %%/000/%/136/%/000/%/000/%/000/%/136/%/000/%/000/%/000/%/142/%/003/%/000/%
   %%/000/%/004/%/001/%/000/%/000/%/136/%/000/%/000/%/000/%/080/%/000/%/000/%
   %%/000/%/032/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/032/%/000/%/000/%/000/%/112/%/000/%/000/%
   %%/000/%/248/%/000/%/000/%/000/%/252/%/001/%/000/%/000/%/254/%/003/%/000/%
   %%/000/%/255/%/007/%/000/%/000/%/255/%/007/%/000/%/000/%/252/%/001/%/000/%
   %%/096/%/252/%/049/%/000/%/112/%/252/%/113/%/000/%/248/%/255/%/255/%/000/%
   %%/252/%/255/%/255/%/001/%/254/%/255/%/255/%/003/%/255/%/255/%/255/%/007/%
   %%/254/%/255/%/255/%/003/%/252/%/255/%/255/%/001/%/248/%/255/%/255/%/000/%
   %%/112/%/252/%/113/%/000/%/096/%/252/%/049/%/000/%/000/%/252/%/001/%/000/%
   %%/000/%/255/%/007/%/000/%/000/%/255/%/007/%/000/%/000/%/254/%/003/%/000/%
   %%/000/%/252/%/001/%/000/%/000/%/248/%/000/%/000/%/000/%/112/%/000/%/000/%
   %%/000/%/032/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%
   %%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%
   %%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%/032/%/099/%/002/%/000/%
   %%/048/%/099/%/006/%/000/%/056/%/099/%/014/%/000/%/252/%/227/%/031/%/000/%
   %%/056/%/099/%/014/%/000/%/048/%/099/%/006/%/000/%/032/%/099/%/002/%/000/%
   %%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%
   %%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%/000/%/099/%/000/%/000/%
   %%/000/%/099/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/128/%/247/%/000/%/000/%
   %%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%
   %%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%
   %%/224/%/247/%/003/%/000/%/240/%/247/%/007/%/000/%/248/%/247/%/015/%/000/%
   %%/252/%/247/%/031/%/000/%/254/%/247/%/063/%/000/%/252/%/247/%/031/%/000/%
   %%/248/%/247/%/015/%/000/%/240/%/247/%/007/%/000/%/224/%/247/%/003/%/000/%
   %%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%
   %%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%/128/%/247/%/000/%/000/%
   %%/128/%/247/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/008/%/000/%/000/%/000/%/028/%/000/%/000/%/000/%/062/%/000/%/000/%
   %%/000/%/127/%/000/%/000/%/000/%/028/%/000/%/000/%/000/%/028/%/000/%/000/%
   %%/032/%/028/%/002/%/000/%/048/%/028/%/006/%/000/%/248/%/255/%/015/%/000/%
   %%/252/%/255/%/031/%/000/%/248/%/255/%/015/%/000/%/048/%/028/%/006/%/000/%
   %%/032/%/028/%/002/%/000/%/000/%/028/%/000/%/000/%/000/%/028/%/000/%/000/%
   %%/000/%/127/%/000/%/000/%/000/%/062/%/000/%/000/%/000/%/028/%/000/%/000/%
   %%/000/%/008/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/008/%/000/%/000/%/000/%/028/%/000/%/000/%
   %%/000/%/062/%/000/%/000/%/000/%/127/%/000/%/000/%/128/%/255/%/000/%/000/%
   %%/128/%/255/%/000/%/000/%/096/%/062/%/003/%/000/%/112/%/062/%/007/%/000/%
   %%/248/%/255/%/015/%/000/%/252/%/255/%/031/%/000/%/254/%/255/%/063/%/000/%
   %%/252/%/255/%/031/%/000/%/248/%/255/%/015/%/000/%/112/%/062/%/007/%/000/%
   %%/096/%/062/%/003/%/000/%/128/%/255/%/000/%/000/%/128/%/255/%/000/%/000/%
   %%/000/%/127/%/000/%/000/%/000/%/062/%/000/%/000/%/000/%/028/%/000/%/000/%
   %%/000/%/008/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/252/%/000/%/000/%/000/%/060/%/000/%/000/%/000/%
   %%/092/%/000/%/000/%/000/%/140/%/000/%/000/%/000/%/020/%/001/%/000/%/000/%
   %%/036/%/002/%/000/%/000/%/064/%/004/%/000/%/000/%/128/%/008/%/000/%/000/%
   %%/000/%/017/%/000/%/000/%/000/%/034/%/001/%/000/%/000/%/068/%/001/%/000/%
   %%/000/%/136/%/001/%/000/%/000/%/208/%/001/%/000/%/000/%/224/%/001/%/000/%
   %%/000/%/248/%/001/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%/000/%
   %%/000/%/000/%/000/";
end
