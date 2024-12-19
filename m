Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2654221447
	for <regressions@lists.linux.dev>; Thu, 19 Dec 2024 14:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.149.199.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734617313; cv=none; b=UHwuUw6tyTaFsoPKd0OmDuyEMAoST8IWB6UnY4uTgnnrRGW+WFeEaJU+Lm86Whml9aDFTvUsfctw2QpdtoMPKnbQsN9onJzsCzD8mK84YHCm9EH41bRqS+94O45UKIV5cXrhB3X21y1xE9SK+sn8nqIHWPDyk1NYHCpbEuU90wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734617313; c=relaxed/simple;
	bh=OdomRgGMAZ+7Gkruf2FnLnYNtL0pl4buhoaas7USuKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFmtqWHU9vvrcyikYZTkOE3c7DB+qdnQJxqkLMOzHJDCqTpWKfvYVv2L/H6LgJN2ohFhSTL8IiyC/pqCDo+cir/ZidP2SQBUoQOmcer1AU8iHsiyZ2joPVGkyiAVJ0O7pTjAnFEU1Z1IVaFhVf93fEf/9yoLik6Sw8+nxJABv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru; spf=pass smtp.mailfrom=ispras.ru; dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b=gjLyOcRC; arc=none smtp.client-ip=83.149.199.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ispras.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ispras.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ispras.ru header.i=@ispras.ru header.b="gjLyOcRC"
Received: from fpc (unknown [5.228.116.177])
	by mail.ispras.ru (Postfix) with ESMTPSA id BC810518E772;
	Thu, 19 Dec 2024 14:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.ispras.ru BC810518E772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ispras.ru;
	s=default; t=1734617300;
	bh=PN/lSWUQsKtbBz9TrgKcGUiuAKNHPffA9fG0t4d/ctI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjLyOcRCBBPdEA4FdVhs+aytu2hIJmCXVKqfH8lH8bca9ShEbTVwHWRDW0MBkVOWV
	 L+/JnhlBRVPFFkYpOXCYM0c+mhONBLobXBTFtJCzI+p2uEPoSJXcLWPxMG4PRApxEX
	 /9L7qDp3BbB6fJOQ5CPhMSF1fgc3XtKXNJd3s22U=
Date: Thu, 19 Dec 2024 17:08:15 +0300
From: Fedor Pchelkin <pchelkin@ispras.ru>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Christoph Hellwig <hch@lst.de>, Takashi Iwai <tiwai@suse.de>
Subject: Re: 6.13/regression/bisected - 133577cad6bf led to error in kernel
 log "DMA-API: snd_hda_intel 0000:03:00.1: device driver failed to check map
 error[device address=0x00000000ffff0000] [size=20480 bytes] [mapped as
 single]"
Message-ID: <20241219-38d93005e76a60255bb87042-pchelkin@ispras.ru>
References: <CABXGCsNB3RsMGvCucOy3byTEOxoc-Ys+zB_HQ=Opb_GhX1ioDA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABXGCsNB3RsMGvCucOy3byTEOxoc-Ys+zB_HQ=Opb_GhX1ioDA@mail.gmail.com>

Hello Mikhail,

thanks for the detailed report!

On Thu, 19. Dec 17:41, Mikhail Gavrilov wrote:
> Hi,
> I'm trying to find the first bad commit that is led to error in kernel log
> "DMA-API: snd_hda_intel 0000:03:00.1: device driver failed to check
> map error[device address=0x00000000ffff0000] [size=20480 bytes]
> [mapped as single]"
> 
> But instead of it, I found the merge commit
> 133577cad6bf48e5a7848c4338124081393bfe8a
> Merge: c4bb3a2d641c aef7ee7649e0
> Author: Linus Torvalds <torvalds@linux-foundation.org>
> Date:   Sat Nov 30 15:36:17 2024 -0800
> 
>     Merge tag 'dma-mapping-6.13-2024-11-30' of
> git://git.infradead.org/users/hch/dma-mapping
> 
>     Pull dma-mapping fix from Christoph Hellwig:
> 
>      - fix physical address calculation for struct dma_debug_entry (Fedor
>        Pchelkin)
> 
>     * tag 'dma-mapping-6.13-2024-11-30' of
> git://git.infradead.org/users/hch/dma-mapping:
>       dma-debug: fix physical address calculation for struct dma_debug_entry
> 
>  kernel/dma/debug.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> 
> I am sure that after reverting this merge
> > git revert -n 133577cad6bf48e5a7848c4338124081393bfe8a -m 1
> the error message was gone.

Somehow I think this may be related to

commit c880a5146642e9d35f88aaa353ae98ffd4fc3f99
Author: Takashi Iwai <tiwai@suse.de>
Date:   Thu Sep 12 17:52:24 2024 +0200

    ALSA: memalloc: Use proper DMA mapping API for x86 WC buffer allocations
    
    The x86 WC page allocation assumes incorrectly the DMA address
    directly taken from the page.  Also it checks the DMA ops
    inappropriately for switching to the own method.
    
    This patch rewrites the stuff to use the proper DMA mapping API
    instead.
    
    Link: https://patch.msgid.link/20240912155227.4078-2-tiwai@suse.de
    Signed-off-by: Takashi Iwai <tiwai@suse.de>


It added the following change

+       dmab->addr = dma_map_single(dmab->dev.dev, p, size, DMA_BIDIRECTIONAL);
+       if (dmab->addr == DMA_MAPPING_ERROR) {
+               do_free_pages(dmab->area, size, true);
+               return NULL;
+       }

> 
> Let's try to figure it out together and find the right bad commit.
> 
> The kernel logs from each bisect step I saved in the attached zip archive.
> 
> > grep -R "device driver failed to check map error" . | sort

And the error message printed indicates the exact same thing. This is the
fragment of the dma-debug kernel code raising the observed error.

	/*
	 * Drivers should use dma_mapping_error() to check the returned
	 * addresses of dma_map_single() and dma_map_page().
	 * If not, print this warning message. See Documentation/core-api/dma-api.rst.
	 */
	if (entry->map_err_type == MAP_ERR_NOT_CHECKED) {
		err_printk(ref->dev, entry,
			   "device driver failed to check map error"
			   "[device address=0x%016llx] [size=%llu bytes] "
			   "[mapped as %s]",
			   ref->dev_addr, ref->size,
			   type2name[entry->type]);
	}

That is, dma_mapping_error() is needed to update the internal state of
dma-debug structures in case of a failure. Otherwise, it'll complain.

Could you test please if the following diff avoids the error message?

diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 13b71069ae18..b3853583d2ae 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -505,7 +505,7 @@ static void *snd_dma_wc_alloc(struct snd_dma_buffer *dmab, size_t size)
        if (!p)
                return NULL;
        dmab->addr = dma_map_single(dmab->dev.dev, p, size, DMA_BIDIRECTIONAL);
-       if (dmab->addr == DMA_MAPPING_ERROR) {
+       if (dma_mapping_error(dmab->dev.dev, dmab->addr)) {
                do_free_pages(dmab->area, size, true);
                return NULL;
        }

> ./dmesg-6.12.0-05-cfd47302ac64b595beb0a67a337b81942146448a.txt:[
> 73.891387] DMA-API: snd_hda_intel 0000:03:00.1: device driver failed
> to check map error[device address=0x00000000ffff0000] [size=20480
> bytes] [mapped as single]
> ./dmesg-6.12.0-10-133577cad6bf48e5a7848c4338124081393bfe8a.txt:[
> 36.391584] DMA-API: snd_hda_intel 0000:03:00.1: device driver failed
> to check map error[device address=0x00000000ffff0000] [size=20480
> bytes] [mapped as single]
> 
> As you can see, the "bad" result happens in steps 05 and 10.
> 
> git bisect start
> # status: waiting for both good and bad commits
> # good: [7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5] Merge tag
> 'for-6.13/dm-changes' of
> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm
> git bisect good 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
> # status: waiting for bad commit, 1 good commit known
> # bad: [e70140ba0d2b1a30467d4af6bcfe761327b9ec95] Get rid of
> 'remove_new' relic from platform driver struct
> git bisect bad e70140ba0d2b1a30467d4af6bcfe761327b9ec95
> # 01 - good: [e33a6d83e1786d5e310ae746c67f5f4e2f93ba35] Merge tag
> 'usb-6.13-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb
> git bisect good e33a6d83e1786d5e310ae746c67f5f4e2f93ba35
> # 02 - good: [2eff01ee2881becc9daaa0d53477ec202136b1f4] Merge tag
> 'char-misc-6.13-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc
> git bisect good 2eff01ee2881becc9daaa0d53477ec202136b1f4
> # 03 - good: [831c1926ee728c3e747255f7c0f434762e8e863d] Merge tag
> 'uml-for-linus-6.13-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/uml/linux
> git bisect good 831c1926ee728c3e747255f7c0f434762e8e863d
> # 04 - good: [6a34dfa15d6edf7e78b8118d862d2db0889cf669] Merge tag
> 'kbuild-v6.13' of
> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild
> git bisect good 6a34dfa15d6edf7e78b8118d862d2db0889cf669
> # 05 - bad: [cfd47302ac64b595beb0a67a337b81942146448a] Merge tag
> 'block-6.13-20242901' of git://git.kernel.dk/linux
> git bisect bad cfd47302ac64b595beb0a67a337b81942146448a
> # 06 - good: [e8b8344de3980709080d86c157d24e7de07d70ad] block, bfq:
> fix bfqq uaf in bfq_limit_depth()
> git bisect good e8b8344de3980709080d86c157d24e7de07d70ad
> # 07 - good: [c4bb3a2d641c02ac2c7aa45534b4cefdf9bf416b] Merge tag
> 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm
> git bisect good c4bb3a2d641c02ac2c7aa45534b4cefdf9bf416b
> # 08 - good: [0c0a4eae26ac78379d0c1db053de168a8febc6c9] io_uring:
> check for overflows in io_pin_pages
> git bisect good 0c0a4eae26ac78379d0c1db053de168a8febc6c9
> # 09 - good: [7eb75ce7527129d7f1fee6951566af409a37a1c4] io_uring/tctx:
> work around xa_store() allocation error issue
> git bisect good 7eb75ce7527129d7f1fee6951566af409a37a1c4
> # 10 - bad: [133577cad6bf48e5a7848c4338124081393bfe8a] Merge tag
> 'dma-mapping-6.13-2024-11-30' of
> git://git.infradead.org/users/hch/dma-mapping
> git bisect bad 133577cad6bf48e5a7848c4338124081393bfe8a
> # 11 - good: [aef7ee7649e02f7fc0d2e5e532f352496976dcb1] dma-debug: fix
> physical address calculation for struct dma_debug_entry
> git bisect good aef7ee7649e02f7fc0d2e5e532f352496976dcb1
> # first bad commit: [133577cad6bf48e5a7848c4338124081393bfe8a] Merge
> tag 'dma-mapping-6.13-2024-11-30' of
> git://git.infradead.org/users/hch/dma-mapping
> 
> Where did I go wrong?
> 
> My machine specs: https://linux-hardware.org/?probe=059108072c
> I attached below also build config.
> 
> -- 
> Best Regards,
> Mike Gavrilov.



