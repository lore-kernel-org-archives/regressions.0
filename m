Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7744204D
	for <regressions@lists.linux.dev>; Fri, 25 Oct 2024 01:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729819397; cv=none; b=rCQ/y+HqbOnBcCU3czTxzK4LX1ijAvPdREyf9CQcpKJch/6wnqmNBZoV3Q045/tYEeE9oSge7LEP/Ngl+oxahpqHH5jz/qg4BHjn8sbhVZLgMGm6AkXAZrKRLqMclORAzXELYZ5xpOavlqIjUZU/t68LfKVKGaPhF6bAyTrsMEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729819397; c=relaxed/simple;
	bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erqHLRpa32mrnusliwQ2c1z5G0P58IU1RXf8u4k0boinpgRzlbkyk3ywebxO+lz9UfYhJK5vy/qTdMhIv3N2Q+NvmZuQ3XI5cmK4XNjVwzr9eK/xPcCwNSqZFUy2cr83xBGQNdHrSBqmmAvND9ecRgjCII2+ubuIknGMs6iOMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu; spf=pass smtp.mailfrom=utexas.edu; dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b=DkhJb4m3; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=utexas.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=utexas.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=utexas.edu header.i=@utexas.edu header.b="DkhJb4m3"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so1220251b3a.1
        for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 18:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=utexas.edu; s=google; t=1729819394; x=1730424194; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
        b=DkhJb4m36s1lMS1crqXEnywdipfofg9S6pl7sCLDsBMK2DNOJsgM7XS4WT48LESZhj
         SCRMVViFxWYxc67Ugu0g5iok/EDMMfwylGfDjkneVh2rn1cY09PIKPrS2No1nxkCc7Vx
         m5L05DwgHiW/4KOnSogp7N39DUXDGtj3nV6ZeQo9EI9Rwb23PonKvmh3bIwriRzs74hJ
         VvEsuMzaB3Wp6KUR1fdnGbpRYlGlEOHP8u9PMP70AqTfEMhMHTATBJ4uGLcu5At/LE99
         AZ+ejlnCaCVQ5rHj3teSdFua9c3H8gtcppS8luwFgyin2Fx04wLUH0xQ5KmdQW1RDmD/
         AB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729819394; x=1730424194;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pIz4D5iSfqKhs9u4Ccrwg9Su/Utf2wLMgSechXdBxec=;
        b=qaGuw9PUBbpifoork6EHxiL8UmYZ5ZS51lOC6S8dN/cFYyrTBsV+2KZr6eKf/i5CY5
         MozCSU1anUoEcb2DSem1Uo1EAyh916MydlmAMja3Vbo3geeH7mP8LC6UHEgsLqUn9Wgk
         6gYebjOhZD1lyB4EPgj51wyN214Va1kVjtUKJoSSfTtnB7Sjzqguz6sO4IdxBZ/t4dP6
         0PIxTseG/G+ELj3QRip2mBTbDqFRIWxPm3za3QqyWg7hRgszd1JCMrYbYznreP3M9FVd
         0zXKgIFmqfwVO1XOmvmHBJdv/fcJg5+UOlyRjgScG0khXlP9Ck0UHGTl3htYlXET6emV
         5L/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZRBHyYGvxPAjtH1ywC653IPHscrToXbdTDT+08UXt7/D57EXX0VPStF/gKjnkBihbyDWFwskQqIXm0A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2eZx6zLIEzHqFGftaOURGnee8yzEH9hA61t/C8wMfx4VAXoFr
	NkG4jaYMuMoj4+eeAOKXg+tW7qG328yxAIqOzGrHsrWVZx2KVoSynFGJgNliD8x8CH7i3mfnINZ
	1M5umQe28cQZgHyfwNt8J/HMqDPHbbdkepVPSWg==
X-Google-Smtp-Source: AGHT+IHfXyziaUAl/+tK39Ykk3K6biro+i36WzXpNeEaPUEW0LrmKuZryiGvNWdoR4dgyxHgV0gJYhyFSUG2HhmvTZI=
X-Received: by 2002:a05:6a21:70c8:b0:1d3:2923:e37 with SMTP id
 adf61e73a8af0-1d989b4ee3amr4495019637.30.1729819394136; Thu, 24 Oct 2024
 18:23:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
 <2024101613-giggling-ceremony-aae7@gregkh> <433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
 <87bjzktncb.wl-tiwai@suse.de> <CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
 <87cyjzrutw.wl-tiwai@suse.de> <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
 <87ttd8jyu3.wl-tiwai@suse.de> <CAEkK70RAWRjRp6_=bSrecSXXMfnepC2P2YriaHUqicv5x5wJWw@mail.gmail.com>
 <87h697jl6c.wl-tiwai@suse.de> <CAEkK70TWL_me58QZXeJSq+=Ry3jA+CgZJttsgAPz1wP7ywqj6A@mail.gmail.com>
 <87ed4akd2a.wl-tiwai@suse.de> <87bjzekcva.wl-tiwai@suse.de>
 <CAEkK70SgwaFNcxni2JUAfz7Ne9a_kdkdLRTOR53uhNzJkBQ3+A@mail.gmail.com>
 <877ca2j60l.wl-tiwai@suse.de> <43fe74e10d1d470e80dc2ae937bc1a43@realtek.com>
 <87ldyh6eyu.wl-tiwai@suse.de> <18d07dccef894f4cb87b78dd548c5bdd@realtek.com>
 <87h6956dgu.wl-tiwai@suse.de> <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
In-Reply-To: <c47a3841cd554c678a0c5e517dd2ea77@realtek.com>
From: Dean Matthew Menezes <dean.menezes@utexas.edu>
Date: Thu, 24 Oct 2024 20:22:38 -0500
Message-ID: <CAEkK70SojedmjbXB+a+g+Bys=VWCOpxzV5GkuMSkAgA-jR2FpA@mail.gmail.com>
Subject: Re: No sound on speakers X1 Carbon Gen 12
To: Kailang <kailang@realtek.com>
Cc: Takashi Iwai <tiwai@suse.de>, "stable@vger.kernel.org" <stable@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linux Sound System <linux-sound@vger.kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

I get the same values for both

axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
0x5a SET_COEF_INDEX 0x00
nid = 0x5a, verb = 0x500, param = 0x0
value = 0x0
axiom /home/dean/linux-6.11.3/sound/pci/hda # hda-verb /dev/snd/hwC0D0
0x5a SET_PROC_COEF 0x00
nid = 0x5a, verb = 0x400, param = 0x0
value = 0x0

axiom /home/dean # hda-verb /dev/snd/hwC0D0 0x5a SET_COEF_INDEX 0x00
nid = 0x5a, verb = 0x500, param = 0x0
value = 0x0
axiom /home/dean # hda-verb /dev/snd/hwC0D0 0x5a SET_PROC_COEF 0x00
nid = 0x5a, verb = 0x400, param = 0x0
value = 0x0
