Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795635132;
	b=jj6pSBG5b4lu5rc0FAidlh/25mY0xx20cKMvYLdWoT4zddDu6TMQBfbBbZMx7/28y222
	 oWAhDDzk1KPSYr0r80Y0wekfcnbiYC+k7MTCraSrdubcx8EXqUnLlHoWt+YcVtWftdUFp
	 cYjYwxb+nQaflYBXTx3oAdKLc4QKCThx3om7TUhn7BuMdPu1Znmq6ufGvZmpFidRUYGJc
	 dcJ+mieHshnPCZezf9Wg4A2zF9VKMP8DLrWKbGWZAMnHlT7Q/rhQduVt/M+408JMNFvmU
	 eudCJfi9Q7vnVGmJ7ZJncA52hI/BhlL/etAso7Gu6LtALMJHrCVoHsRziDUozs6qQdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795635132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
	b=rdsMECssEMQVtAPPJbr0kfec9T0tJlTgfX+AFc1NkOCFMVbZLUd4HwfvBr/81hDz5yNT
	 lX2hviwwJonHWk212CIbp4ZBAxNYO24ryJHlBEcgjoRdhDkpGJ1TJarFqRh/jDsVNi8b9
	 6LWjYXaijA7qXXBKcI7vCw36NsRd4kzjlr2SmZwQxpnCcC/+MKKY6dIptnPW9a+8kF6z5
	 rKhXeT1HF1kdzyRJo4bl8YwgBOQYop3nuKwWbTYO9sCjrFxqc6FtEx3u9cmoZ5QPPs902
	 jo3iQQclIdcmU8t9kIOz9KsKnIwsumcopC/eJQ/Tvn9hBrUYzHgRC5wfBVn3tlTtShw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MkoVEMFM;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F569606A321
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 19:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F569606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MkoVEMFM
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4b52fcb410dso2044062f8f.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 11:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795635131; x=1796239931; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
        b=MkoVEMFM1/tcDUzihzfdcbE83qq4rkPagR/eZxRxjdye5jTVCbfhHT0Vr3PIuWwowE
         gqKUvA/8bwLILQEKRQssI10t1r6pDLmnzXOPeKN+fIanei4VxelCe/tn7tHVwkNddIK2
         vdlnza9gXjme9VxqDw9Qv9rzldcJeI6LRmKMg+HA6FnxM2J2nFUoSSdduWqY3DzxAL02
         BiwJQVsUpb1++GgGZoyoyDV2wXiM46H0AcJSaWZfaXNXxpKdObC2WpO+PIqS4Pyw4AjK
         7TanaXBlHJLiN91xL3joOwi/Pbpie9VLZaEKnCZg1+l8J65uMpl9gcfdmDEV2/Mr1uZn
         +aVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795635131; x=1796239931;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ovHHtD+g/v2rwITp+yEHB4bzDII1NkPaoQCCK2QFSd4=;
        b=u2JyQ8XH5uwJJmZnf+/JKflZyePReuqZAKmM3U8aiqC2It/eVWE+9T61gTamkcIGJp
         3HhOikSaS7V7wIhQub602PLd1m24L84nmkm7dadvpCm4Pl31T9LKdpBRtLmXlgYnHU4f
         VDX2mIT090IOtm3jSRkhe1YYLNc5TfQlLjD+juunp9MwFN32KzuAiqttGqEy6bIi/guX
         b65FkPZfXUDOslQ6ccng+bbLO5YmChXRCJdHwXiAAs5ITK2r/05/r0gq76aQ87CTmKgE
         bJaM4blgrtAFJxX67Jp92HUZapeyuRMBOfa3QFQXxE/cVyjS9ceLqAtLebw/eQ0hqO/u
         3GMg==
X-Forwarded-Encrypted: i=1; AL+hErH/BmzA+Op0nP97DE+JKDgcefMXMxoCTJJLsREvqsVgWdpFsM4O5riS9TsBnbBPg0ol9UxkjJB5iSEBbw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+uURK04vmqiJVv9RrIenrQLDKMGCoGPZ+WsapEc4dn3HEqTm7G
	AtE5R9/+fHbXx9wtaWDV2SYXDFfSRFLInlgLDCJRzTo0ZBjWg5qt4gDCcGqhfg==
X-Gm-Gg: AZFdTZePCE8E56aQDSVxoRm3Rjhz7QmJHHnBP3SnrXHU4/rv6pmbGA/BDPPPSGfx8Jz
	qyBhcrEjR0gicjysmfCuM2MxwlKuXdJ4ijWyf6123+iZsXctQLfiY0I1M2df+zzCXibYb0qq+TR
	GRxTEV4+ni7YXKbqn166u50lggY764vyfNfmdXpvDikhAU/4KO3pGpTmI9yk7q9EVUo6F5LrowL
	50JmTh8+dzTgQPzbnjUdBZSx4Cz2u6Uqy+54Ve07W1iiNFbHFDbMfxjfbpyatGROjInyg1hRSq5
	9oharyT8lqokIIEZqj6nrgxIiq5iy1gPMDkTtFpDbNVSfLhGMSIZ+duGUUFJdpCXBxqJgEM5Grm
	guU17ZOzm4wSluWXkHRZz4UT4HQVySEpYQSC77ycXL0FGHGZ00a+4jfQZsFku9dvAKzUdMBllR/
	ao3M7PaUvgPfvy5Kri4GAteKaoBOwYFR5A2auo7RCSkxBi6pL4j6urbNp/Tm61s6ijgTAhTV8KQ
	emuOXkRtAXoZPKAAbQ2ItGFcqtJv8xHt5qGjQquFzgHvFb1KpqtM4qTo/QalUBaoV89Q92BhbKq
	idqcDzbCBT5GYv6wC3PyZFMhqUFIXG8kzjYfh3cYYw==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr375307005e9.11.1795635130719;
        Wed, 25 Nov 2026 11:32:10 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906e4ce6sm317579885e9.4.2026.11.25.11.32.09
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 11:32:10 -0800 (PST)
Date: Wed, 25 Nov 2026 20:32:11 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Flavio Giacchetti <flv.giacchetti@gmail.com>
Cc: linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.com>,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] Creative Sound Blaster X3 (041e:3264) fails USB
 audio probe on Fedora 7.3.4
Message-ID: <20261125203211.76029bf0.michal.pecio@gmail.com>
In-Reply-To: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
References: <CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 10:46:58 -0600, Flavio Giacchetti wrote:
> Hi,
> 
> My Creative Sound Blaster X3 stopped appearing in ALSA on Fedora 45
> after the update from 7.3.3-300.fc45.x86_64 to 7.3.4-300.fc45.x86_64.
> Booting the previous Fedora kernel restores audio on this PC.
> 
> Hardware:
> 
>   USB device: Creative Sound Blaster X3, 041e:3264, bcdDevice 10.90
>   Host controller: Intel 600 Series xHCI [8086:7ae0], revision 11
>   Connection: rear motherboard USB port, enumerated at 480 Mb/s
> 
> With the stock 7.3.4 Fedora kernel, the failure reproduced on two rear
> USB ports. On one failed plug-in the kernel enumerated the device,
> bound cdc_acm to interface 1 and then logged a disconnect. After
> re-enumeration, the USB audio driver repeatedly failed to query sample
> rates and mixer controls. The X3 never appeared in /proc/asound/cards.
> 
>   cdc_acm 1-12:1.1: ttyACM0: USB ACM device
>   usb 1-12: USB disconnect, device number 7
>   ...
>   usb 1-12: parse_audio_format_rates_v2v3(): unable to retrieve number
> of sample rates (clock 33)
>   ...
>   usb 1-12: 13:3: failed to get current value for ch 0 (-110)
> 
> An experimental cdc-acm quirk skips interface 1 for 041e:3264 only.
> With that module on the same 7.3.4 Fedora kernel, the X3 registered
> with ALSA and played stereo audio at 48 kHz. The first hot-plug test
> still logged errors during re-enumeration, then recovered. On a
> subsequent normal reboot with the patched module installed and the X3
> connected, ALSA and PipeWire exposed the output and input, and the
> earlier rate-query errors and timeouts did not recur. Playback worked
> after the reboot.
> 
> This is the result of testing one unit on one host. I have not isolated
> the first bad upstream commit or established what functionality needs
> the ACM interface. The results so far are for Fedora kernels.
> 
> Would a device-scoped ACM exclusion be appropriate here, or would a
> comparison of USB traces with and without the ACM binding help narrow
> this down?

Hi,

Does the 7.3.3 kernel also bind to that CDC interface, but without
triggering disconnection and other problems? If this used to work
then it might be better to fix it to work again.

If no one has better ideas, can you reproduce on upstream kernels and
try git-bisect? Or run "git log --oneline v7.3.3..v7.3.4 drivers/usb/"
and manually bisect these commits, because it's likely a USB bug.

Regards,
Michal
