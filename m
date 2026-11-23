Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795422617;
	b=c6dK32ohXp7WLNqtJxMXg1bhdZq9eKHZVD1gFEuU45OQmdqDgXTAqQQ03Bl0cGN5Tjzo
	 lPr+ynVaAsfma/lJYlsDSHbdMaplImhosu3MQqvvttQ6otQhU7sJ3S+dCI0TuKJopzq+H
	 Cn6SCOI7jaszIw44gtqyrhAoLw++czAsoKnjAXqReCbpTpGid0RSjvmjL/bhKkUQwkmqK
	 2CVq3wUkY9QvNJ78xvf9Byre55KnYsPzPAVy2HkEB//VSKgGFFlgS1pYMWveAcXdFLcIH
	 NNreVC6YTIa87ImGKgm6FUuvtpUPZkLDTZFdh8fGEWZsPaYvAJKdWX3e/kBW8NlTNHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795422617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
	b=ADamoPpRU1365hYNejHJ+iWRbndQ4Rz/OgWJh11iy5FqwGiekGDPwBIPtbkT82JkQjD6
	 jjdgmhMbVIQB8tmIV1jmXIlHNAHDCMmFR6nSG8XSkODxU+vkYZ5XbKwMMDYmYoWDdPCsg
	 dwfqvZCVVLiymVq1BX/z6lxfmWtyPGm0zgkL40OBKnf70UbLj0jQ6CgAxSBQEf68WlaG8
	 clYrIHGmzTe3yJa+OQwN2K/Q8phjXW/tkCKQHJdy8acUUSZcAbp84Gvq2txsxWm5E28hS
	 LgRxRhft6cbVaJfLQhMyj5TJfbNOo2sMakDk1Az7bDtxmmWaydCzkuHcU5OvnSVymqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZxiAJyfK;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB21606A337
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 08:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB21606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZxiAJyfK
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f046b0adc0so13938665ad.1
        for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 00:30:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795422616; x=1796027416; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
        b=ZxiAJyfKdlA3hnWX8jlNRHWi1KPvdr2T1YQhznbkPuE/OA/5WtTWMVLwewzU9CsWHL
         OgbM4xNWPm9cIE13yzzj53s07Ou2/KZh07hXq6n3uROBPPDEcrDQ5GoHyU2/to/k4DHi
         6RHc4kjxI1iPnVjq9AEbIceOCSpj9hmfQhb5D+qVIHIOZ/+J5U3aX3wU5JriuubLS/bz
         lw3s5kOD2Y6Eoh9wM4Q4gvvaKKEhkXuvk4dKZApzZISgSqIXEnw8+alDE8hNI4m+UPpH
         Adag1lugNE28rlURaVSKbJqDB8kZfl8fVLcWMVqHOfbcijtbK3lCMk5NVaJk/YbuK9jB
         BH6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795422616; x=1796027416;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF0ZaQFZtpES7I3ketM+dRHHQj/moZ8rhgorfDfzl0M=;
        b=OEBh1CSXGCD/1M8GTEiRXTBITipnvySSWZNzxy/QkOYFTusgCs6p7QZRRUXzngIlxC
         pBlVn90W2U4UvSw65W6XrSRvlcEW/fVHaqB6CCK0CZtSNSE4tc55dxa/xJKwXIPS1U7M
         NRKBFCV8VhqSV7WQ1gZvPmnmK3Xri06H3juKVEC5xs2dbRM1JPDjjnWq+w/57v6eGoao
         UWk9zuCyo7vP6MgsRopkFqxudN3vOMA+l4ymSNl0NDjWTCkug6xig9zPA1Pt/wkpohy3
         v6xC/5vRzmZZBPm41fDBYo838Cv1Hsp7wSRtyeAa1Xh2HXDgUfi3k/bFHgAvw5y1le6f
         5Fpw==
X-Forwarded-Encrypted: i=1; AL+hErETzGquUv2VvBdCsDQPGT3OXBBVdjS8lgLyTLP15IIzDuw7tChMYL7TrGmHHI9BuNyBrpm0EdIBHgug+g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Kaojv4yilOgnDm78cuTCYIC5gJ/JJ5w48GOnT15TIJh5yqXxE
	GHA4nWVgFLNlLytw1OTpcRimekqAejoaIL+zgvjoCfnMYgAiDIyYGf99
X-Gm-Gg: AZFdTZfqyGyrg45kMCGCns0GTkh1XnboHn5ys2iZY0Z1FMIoT6Rox0gAYonnC9enOTu
	0wZQEJfcANZAlqFBkLIHBDHAtasccERkzsYHqnjYR9Ub85H0mbFkbNygkSc3yU7KEwYyE/jcLTn
	hLLoa3d15xTSFo1jQcSfvSNfSIHx2BTEHx1VcjJjphYwxCDjQjdf6DxyB5joVYsIlpRHKdGqPSN
	K0TMvcsDKA5ESL7eTwmu4S/DIMqkGYwWiBy9IvW4kZ7OIQGJ9brtfhFeNKx9pBtgJCR4NHcfYV4
	E7pQ+zSWt4EOOcJkSgE6qe5y35T2+QkaPmHY3WF0yHzUkXtrmvIuH86yj5q8h2ILGVospDh7zma
	qIWU9JFWWxEPtCoPVgvq4HOJOURFJkROCKTALnHWnHTujQE7lmQZ6RLcs4nnPHhYBWlQ1brZ949
	PaOzA/2PDDw4lPkPGGaa4qC/eP0dUuBT23n11+uVwRHnU273tW+BtdDU+edAurObYtQdjK8UpCp
	hMei2uLfZUtmYUcNoHJwFzTOKS3+mQS+mjgbtH/rLNE159DctGTKGyA5MrS7ucCZe6L1Yf+9hns
	5tHlyhl83mEjWLxqDyzkHjwGBcpiPKf/1oaGcuJae6LHBsobolvhXgFXPsWv
X-Received: by 2002:a17:902:f544:b0:2f0:8fee:c878 with SMTP id d9443c01a7336-2f08feec93bmr28221845ad.8.1795422616276;
        Mon, 23 Nov 2026 00:30:16 -0800 (PST)
Received: from localhost (211-23-53-87.hinet-ip.hinet.net. [211.23.53.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f08164dacbsm19643025ad.68.2026.11.23.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:30:15 -0800 (PST)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, perex@perex.cz, linux-sound@vger.kernel.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [REGRESSION] ALSA: hda/realtek: Higole F9B fixup breaks speakers
 on unrelated Apollo Lake laptop (10ec:111e)
Date: Mon, 23 Nov 2026 16:30:13 +0800
Message-ID: <179542261324.542908.13953751300676446171@gmail.com>
In-Reply-To: <87pkvx5625.wl-tiwai@suse.de>
References:
 <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
 <87cxrx70qe.wl-tiwai@suse.de> <87pkvx5625.wl-tiwai@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Sun, 22 Nov 2026 14:50:10 +0100, Takashi Iwai wrote:
> > Yu-Hsiang, could you check whether the quirk can be replaced with
> > HDA_QUIRK_ENTRY() with the codec ID instead?
>
> Correction: here I meant "codec SSID", of course.

Sorry for the breakage. The codec SSID doesn't help, unfortunately:
it is 0x10ec111e on both machines. Cristian's codec dumps show
"Subsystem Id: 0x10ec111e", the same as on the F9B, so an
HDA_CODEC_QUIRK() entry would still match his laptop.

Please go ahead with the revert.

The commit is in 7.3 and was backported to 6.1.y, 6.6.y, 6.12.y,
6.18.y and 7.2.y, so the revert will need Cc: stable.

For the record, this is how the fixup silences his speakers. His BIOS
declares two internal speaker pins, 0x1a and 0x14, besides the
headphone on 0x15. Without the fixup, the headphone gets DAC 0x02 and
both speaker pins get DAC 0x03. With it, 0x14 can only use mixer 0x0c,
so it shares DAC 0x02 with the headphone. That DAC holds "Headphone
Playback Volume", and PipeWire turns it all the way down while the
speaker is the active output.

Also, pin 0x14 on his laptop follows its connection select, which is
not what I saw on the F9B. I'll re-check the F9B before proposing a
narrower match, and I'll Cc Cristian so he can test it.

Cristian, thanks for the report and the dumps.

Thanks,
Yu-Hsiang
