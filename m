Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363F4FD289
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 11:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682145; cv=none; b=fkh4+7mmrM0G9rgICNesYwWkyXI7nhGRoSeafp/yA1nRdpeQN4gKd5ytKtKWWbjEAMe97KdsXgSlhVeutXPIV77Wx7BIWmPpvSR5A8B7Heyxdais+MCFZORW8aur9wvme0koaeg0JwfHkZWjtrRj0FetKi9jEAWDb8iNMhaZZAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682145; c=relaxed/simple;
	bh=ye2gp5Y2CP963eYs7VQJu+LUBZo/4xZhUhdZdNbqwDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FH+a0VIgQt6tp+eoQF9lOvIe0zLpidItpURpa8eyEg/faAmrEiARnK1rWAfXIAHIu9EGzZw6EgVJqgeI//JwgCOQz6eYofBmRUyXTGW2uRBzHZOh22ZlB+UOgboTsGmhZhJMtlQEY3SlEY3pzo3PurHUTYdzFW5/wzv34vZ0FsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b=E9iAaez8; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.lentfer@web.de header.b="E9iAaez8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790682130; x=1791286930; i=jan.lentfer@web.de;
	bh=a7qQ39UjbeXduB3PGMMPR7QDax0wMe286QF3Uoml6hY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=E9iAaez8RZhe/cbvdUydHKX2VW4huT+9Iw27OT1N/3w75UwZp76nAaGGdwolR5q7
	 pvacvRsxXbdfAcksc3IwQ4hvsLFuasiTU/H3Dmqfm922XbqfINCQR4oYjgKePoVZR
	 Uf+URtG07Jmayd526kVWKhk9lrqPoS37I7qLONFWXzl4s0jfoqeGAVq+3K5wBQ0+M
	 I9oLI/Jj8TXngb9Q/9xmnqA/AWx3RU04BbCol/oICDtS7A4M6ofKNUT/3vaLSa+ey
	 CKmjqNMnfKC/8AXm3A1WPmFWjMJExjri6LnU3uUgEKXQvw6EDCnar9cER/UKa9iFj
	 fO6UyIVycaIVpF7SZw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M76bV-1x5Dd03NvD-002S7Z; Tue, 29
 Sep 2026 13:42:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by vm-mailsrv.lan.net (Postfix) with ESMTP id AE23DF133;
	Tue, 29 Sep 2026 13:42:08 +0200 (CEST)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level:
Received: from vm-mailsrv.lan.net ([127.0.0.1])
	by localhost (vm-mailsrv.lan.net [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZjomxOUGvWQ; Tue, 29 Sep 2026 13:42:05 +0200 (CEST)
Received: from [10.94.76.105] (ts-d20.lan.net [10.94.76.105])
	by vm-mailsrv.lan.net (Postfix) with ESMTPS id 4C451F12B;
	Tue, 29 Sep 2026 13:42:05 +0200 (CEST)
Message-ID: <272336a8-ab7c-4f9a-ac0c-c438b94caeca@web.de>
Date: Tue, 29 Sep 2026 13:42:04 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ALSA: usb-audio: Behringer USB-MIDI output stalls,
 since "Use strings in struct usb_dev for manufacturer & co"
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, regressions@lists.linux.dev
References: <e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de>
 <875wzo2tya.wl-tiwai@suse.de>
Content-Language: en-US
From: Jan Lentfer <jan.lentfer@web.de>
In-Reply-To: <875wzo2tya.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uhHAKtVB5lTKq1BKKuviyWhAFCTjgkfQ8YEGba4F8e2e/z843ox
 69CXld+UKfJlkwYF+PA0SHhkrjrHt87jDlq8u6p62UwCheWPjjC6miVVR8PMAO5GWXvc/9A
 7xATdaadiYX9KpPi71LrlL7tJJohfzOZxMD7PFcJMso73zCkpMPSScrF+lElaHRkwBrUl9X
 24BEF93B8VcvbNk/wXiwA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:NYm5/3G34YI=;En6ntC4KTzmC/EGP9n3UIGQmsQT
 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
 vbBWMjA2OsDVTGDIwx+Q86G7fg==

> Thanks for the report.
>
> Can this be fixed by applying the same boot quirk for Behringer CM1A
> (something like below)?
>
> Or do we need explicit usb_string() calls instead?  If yes, which one
> (iProduct, iManufacturer) matters?
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -1785,6 +1785,9 @@ int snd_usb_apply_boot_quirk_once(struct usb_devic=
e *dev,
>   	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version *=
/
>   		return snd_usb_motu_m_series_boot_quirk(dev);
>   	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
> +	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
> +	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
> +	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
>   		return snd_usb_cm1a_boot_quirk(dev);
>   	case USB_ID(0x2717, 0xd005): /* Xiaomi audio connector */
>   		snd_usb_xiaomi_boot_quirk(dev);


The CM1A quirk should be sufficient. No usb_string() is needed.

I reproduced the CM1A quirk's request from userspace on 7.2.8 (usbfs
USBDEVFS_CONTROL, no wake-up udev rule active):

1. Power-cycle the K-2 MK II and send notes: the output stalls as before
 =C2=A0 =C2=A0(rawmidi Tx 21, avail 4021, 7 bulk-OUT URBs pending).
2. Send a single GET_DESCRIPTOR(DEVICE, 18 bytes)
 =C2=A0 =C2=A0(80 06 0100 0000 0012), nothing else. The pending URBs compl=
ete
 =C2=A0 =C2=A0immediately (Tx 21 -> 96, buffer drained), and all following=
 MIDI
 =C2=A0 =C2=A0output works.

A GET_DESCRIPTOR(STRING 2) instead has the same effect (tested
earlier). So it looks like any standard control request after
SET_CONFIGURATION wakes the endpoint, same as on the CM1A.

I have only verified this on the K-2 MK II (1397:1230). The KOBOL
EXPANDER (1397:1249) and 2-XM (1397:1256) run the same firmware
family, have identical descriptors and show the identical stall, so
I'd expect the quirk to cover them as well.

Thanks,
Jan

