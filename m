Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D6D7D3F4
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 10:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489821; cv=none; b=JhY40dUawhfwCKZvaeRAZ6Ee0iMUK+EnkPar9SeDHgACQ2j/jYku55sA2HloCJklqQGdjbs2cnd9g8RDac1dyeLg8jRO5gOpJOK+BvlmuisnNGFHXKNZQoEKn+8MD09RzBixiDgSPDXUQlUX9JKjyzEQHpv2PRC+58Nchbz1HYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489821; c=relaxed/simple;
	bh=yfXM1WUeNYT3vmj9qVVHXyrTV7rNpEMGeMSekthQuOg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jQ5beB2DH3pAmAGY/efYJzeK9uMNHo1IjnVe19GC3ikoMYdf6C6oi5c7KXzBYygcc7HHT18gJjvN+lpXB3mpk3IO9S8bqigjzwEvXWBFA6umg/fnqDG9RsYuft1fVAaELg9FCaJWtLHLUtWuZjnpmUJVNsVkXmnzvEtili6m+O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MOPZuv1f; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MOPZuv1f"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so422705e9.0
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 03:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745489818; x=1746094618; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vFPjM8NK9GyF20CpuZlo+gQtBKK1SMRDaSpIXrmNbvw=;
        b=MOPZuv1fpBi23+0rdbZCmPfJnxSLa8zX9u8o8gWBgPZgVhnorme2v3wJM1VPNYj1cn
         CL7YfAOzPF1ao5BN563cDtwdTQjWV7mQGTEUF+3IS/iIQkt4aoi8cmoM0zUE4dMaxrue
         jl2OWZecCde2WR35vPcbDomvCRu5PXNPk6MxWVd1cYsDnmZ/xQ5ueGdERMFsYN/+thk/
         2lg2hLQAvvhT6nmbfZTavPLFde9FsG4X5eaZusVhOhnoOg2hTts1TwdBFBClrS0QG+A6
         y1QUzSh36vr9i9sDlU7n4q7Chn6qvekPfQZZCPmEr2EU+u7U2lWeeENaB60oydxqI7BB
         Cv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489818; x=1746094618;
        h=content-transfer-encoding:in-reply-to:disposition-notification-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFPjM8NK9GyF20CpuZlo+gQtBKK1SMRDaSpIXrmNbvw=;
        b=t2ASut6TfMiqu3Uo9e2jAzkcmqW47sT+w/7eXodErZVRxRBJUEL/xRxIHdeO7UXAej
         y0FDjbPRZVzzueM+CnF86VlphlOwlcNDBa4f4q54IySPMB6oNnBSnmieB34unsnBk3U6
         al0bGrVt+U3XElzD9oYqQHMOeYJ1B2hcdKbZ4F9Bv2y78keG0A52DxkBZAMWPWTW5kzN
         TmsubQ4BFfx7rH5bdC9J6Jhy763ps6KIaszNjiIZgEaPe5TKBZHJ6pqkoo+UZUV/WZLn
         N5vD3hsZ2NkIHqOLSp4zSqf6YEoxjyUO19O4ym7B/prgfQgJwEcW2RsKA7DCxKrEUqE8
         bWnw==
X-Forwarded-Encrypted: i=1; AJvYcCW3XuVF9vQn+QgPK13RKltvOfY+KE1giEUyZKdbKO7azEwuUY+xorCANi3Id7dVjqwlS+uzrO9B1kASiQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAiaiVmJo1Rb0LVX0oAYLNs7FMzyN0DkNVbWXRERLvUZZRWPkJ
	HvzT5MpJPmqYR4bAgVlswNpPEZMW4keT3ruBMD2SbqW6PA7jWDGe8/hdpTbV
X-Gm-Gg: ASbGncuEVHriiA0oW5feGKyY0BeSLAjhEfWrAWq+itd+8kkHDt6p7jTlDi5vr/aUnXO
	yW3cNCi6f0rCLnruQsnzHWRu8g26alDcYhCvTOdPaD+W2nCBWt/+CL+R/Nbo2YR7T7OVyD6eNku
	sbCRSkWt7HS73wsLw4i0ChB+9FOIUNSdqvg6lvxXcf963nuMHedeftb0N0lxlVNyk/kCgudghOb
	wEjdprtu9Oc3/JWnRrgIZjb6YHrHS+UQKPv5gHRzUxvVrOQefytpNdC0lgZApGqpDcA9RTI0fQz
	8SZkHXmiDweiOcOza/onnW+BN82gdyCPQeuQoM7NZ6ynoHU=
X-Google-Smtp-Source: AGHT+IHL94sgQwqKY15lIUcNNEjM6NiojQ5BvgYuP6XkWKsj9tOrpDMsNcnIJAOjkcwR675PXnz0AA==
X-Received: by 2002:a05:600c:4706:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-4409bc057b4mr6833625e9.0.1745489817395;
        Thu, 24 Apr 2025 03:16:57 -0700 (PDT)
Received: from [192.168.36.152] ([82.66.27.2])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4408d04802fsm46884505e9.1.2025.04.24.03.16.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:16:56 -0700 (PDT)
From: "=?UTF-8?Q?Jean-Fran=C3=A7ois_Ingelaere?=" <masterprenium@gmail.com>
X-Google-Original-From: =?UTF-8?Q?Jean-Fran=C3=A7ois_Ingelaere?= <MasterPrenium@gmail.com>
Message-ID: <04dca014-881c-46b4-a084-2001c62b466e@gmail.com>
Date: Thu, 24 Apr 2025 12:16:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: FW: Wireless speed regression issue with >6.12.12/6.13.x +
 firmware update for mediatek MT7925
To: =?UTF-8?B?TWluZ3llbiBIc2llaCAo6Kyd5piO6Ku6KQ==?=
 <Mingyen.Hsieh@mediatek.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "kvalo@kernel.org" <kvalo@kernel.org>,
 =?UTF-8?B?QWxsYW4gV2FuZyAo546L5a625YGJKQ==?= <Allan.Wang@mediatek.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CACr2tqu10_mXiXw-Q3VSqYBJhQU1s_m77_uhvjpe0j3H3jhbgA@mail.gmail.com>
 <TYZPR03MB61644B8F34946A73E2C16E27F4DF2@TYZPR03MB6164.apcprd03.prod.outlook.com>
 <5a07aea2090532682c8cd4df3ab1b9026f2e1cd5.camel@mediatek.com>
Content-Language: fr-FR
In-Reply-To: <5a07aea2090532682c8cd4df3ab1b9026f2e1cd5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello guys,

I've just tested 6.14.3 kernel which seems to include the patched 
driver. Issue is still present, in Wi-FI 6.

Here are some more testings :

6.14.3 + firmware-202412x speed is NOT correct in download but correct 
in upload (20Mbps/750Mbps)
6.14.3 + firmware-202504x speed is NOT correct in download and in upload 
(<10Mbps/<10Mbps) 98% of time
6.14.3 + firmware-202504x speed is more or less correct in download and 
in NOT correct upload (400Mbps/<10Mbps) 2% of time

With older firmware, speed results are inverted as in 6.12.12 kernel (DL 
/ UP), with newer firmware, upload never work correctly.

Please note the speed is mono-thread/mono-stream (ex : iperf -P 1), 
while running multiple simultaneous connections, the DL speed with newer 
firmware seems quite OK. While I'm not having any issue in <=6.12.12 
with mono stream.
Remarks regarding upload speed doesn't change.

Any idea ?

Best regards,


Le 17/03/2025 à 03:12, Mingyen Hsieh (謝明諺) a écrit :
>
> Hi,
>
> Thanks for reporting this issue. We will conduct testing again.
>
> And it is already known that the patch added in 6.12.13 does have some
> issues, but we have also submitted new patches to fix.
>
> Currently, these patches are in the maintainer’s tree. It should soon
> be included in 6.14 and then ported Back to 6.12.x and 6.13.x.
>
> Perhaps you can test the driver from here:
> https://github.com/nbd168/wireless and apply this patch:
> https://patchwork.kernel.org/project/linux-wireless/patch/20250317011724.3326979-1-mingyen.hsieh@mediatek.com/
>
> Thanks
>
> Best Regards,
> Yen.
>
>
> *********** MEDIATEK Confidentiality Notice ***********
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or
> otherwise exempt from disclosure under applicable laws. It is
> intended to be conveyed only to the designated recipient(s). Any
> use, dissemination, distribution, printing, retaining or copying
> of this e-mail (including its attachments) by unintended recipient(s)
> is strictly prohibited and may be unlawful. If you are not an
> intended recipient of this e-mail, or believe that you have received
> this e-mail in error, please notify the sender immediately
> (by replying to this e-mail), delete any and all copies of this
> e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
