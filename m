Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46947218E82
	for <regressions@lists.linux.dev>; Thu,  5 Dec 2024 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733403599; cv=none; b=SzJ3pUpOAdZK9/li/uxUwsm/ZL6fV6C14KA9IKYXEhYDL/UhaTYiIYqDOY6W1bT/n76hX/qFqdr/YNhKIH6Usaa+dPv7h2QBBzdzax1NvVGvgrGw35naX7q/ZvgrY3McFjxtVcNhEnqZszsx2sw25vJyDJer0FjNwicFu70aBH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733403599; c=relaxed/simple;
	bh=3OLFaKBgiFhJWCsDnLEuwFuf20ClzJ0AMK/6ux9BfP4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jnwtEAmWXEv3JOR64e+Zeu3o99m4q97IDEPm7z+NPSkCncx5isgg3NnuY2JQW7jpyIIc8qGP7q6jDeRvNDkf3tvDQz3c/ww2Qu/3gLy2Q+FhgvIMm/FMp7nAXCparz+mk75Jijdq4uMFKAC3e4XrQeSUp+ISDRIC8daX5U7Qlqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAQROyvF; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAQROyvF"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0d71d7f00so1316903a12.3
        for <regressions@lists.linux.dev>; Thu, 05 Dec 2024 04:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733403597; x=1734008397; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gj8VFVjPSZEkv+oUvBeuosT9Pxl2p7BzaNCPNYLTVfQ=;
        b=KAQROyvFquhUTV1QiP9bwbcaD/uOjcru9snQj6Smfy5MS22wy/ov+gXgcoN/eMVKck
         04X8X0sL0TGpHT0gZrjxp6pbFVS2CrN0YvinCtvCTqcc/TO7IrUN/IXCaSVI2Q/J4wYS
         AU0ezfEZBbISxUWIVIeG7uWf/rSd2GMRVPmx4sTutxl6//r/pycRotHrcibLhStNKCmR
         NApEMgzlbzbyKPa76kFW6t93MokHUsuzv/p90Pp6FcUi4E+vL6cQyqbEUL3HDVhYd8dq
         u/HqgApPGlNkriGmhbZB2k61ljOEqX7JheyNeu3+OuPQceOBR7iZGUq4wBeynBaJAN+p
         plvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733403597; x=1734008397;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gj8VFVjPSZEkv+oUvBeuosT9Pxl2p7BzaNCPNYLTVfQ=;
        b=LNbljXxO4wIGY6cPDCAFLeo4bmYlX67TUF+Czz1VIkfjsxXvojvwb27Fcix7MGVGTs
         xRF99thK+qAENjKg+zogorWJsClCb4mPw62dm/BrSPr5G1aZ0PHxBtDowo7wm/evNmK5
         6i3zUOp+pDGa35U+6NvfboURPayFwp94QxBSwBImAXr0KLAOOqXhmbM9Rm/9o2nggSXW
         roGePho+Q2ppHGsFGNWzR8glP2ww0amDDjCrn82mrsu/EyMQFQZSukXeNPAJ+T/Tzw0P
         WsfMhmjWZBJl08U3JWW1cSGXPXnHCS/cvrjZM6xnJeQML/xBrLlL9iEi4acjEB3mnddd
         9OEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHDNdGi+b+1+SQ7I53byTcXu+nyB8LVufu8F7uBHU/ZM4yz5aiqunxM9bUMJnBpHT7yzbVmW7mmHm3Lg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/rA1cRNSqUujzvdU/1bG/1IyeqyDIDAffoue+R/7+PYjaLv3g
	iHuxMXiJhtnCWILwiD5mCIAlKwwK4ATY6AhaGo+4S3NABsa5Cbu4
X-Gm-Gg: ASbGnct3Qma4kDbtSSFryK1SRy02a9mhd/TiKjm5l7Ah0i4vXt2W6asQuto2B2WhBYh
	mWdWRycxtVGQYSZm0TOVMhj7eV+lM6pzMWN5TIeUm1Cm2VPXaQg7kCYLeP7N58t0PHVxUYLrdte
	prgfHwVuDayyo55ksjbYEeuJyxcyaiFV4zFOBEQLE6QYU7pkWzTrqT1wYakGpDvBaU0r0jvpegk
	2V7o1OcODu5u+AxDvyciGs+RaNoPyOqWnN7XsgGE2Ly4iNPeJOyR7d9rBdKkyldedXPnQF7oFZ7
	TEQYPJ7rql5nBoHz/+5jBtDsOLFGTSbxQg==
X-Google-Smtp-Source: AGHT+IEF+6FFvVmIuxk1MISOcv5BF4xk0eVILKN9vM5sXj6JFuPJooKQkMvDCoXx5Oq1Cpz44ra8Kw==
X-Received: by 2002:a17:906:9a95:b0:aa6:c55:739a with SMTP id a640c23a62f3a-aa60c5574a7mr571964266b.50.1733403596420;
        Thu, 05 Dec 2024 04:59:56 -0800 (PST)
Received: from [155.185.125.95] (wifi-125-dhcprange-125-95.wifi.unimo.it. [155.185.125.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dc95sm88774466b.38.2024.12.05.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 04:59:56 -0800 (PST)
Message-ID: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
Date: Thu, 5 Dec 2024 13:59:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergio Callegari <sergio.callegari@gmail.com>
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
To: jglotzer@gmail.com
Cc: Aaron.Hou@mediatek.com, Chris.Lu@mediatek.com, Deren.Wu@mediatek.com,
 Hao.Qin@mediatek.com, Sean.Wang@mediatek.com, johan.hedberg@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, luiz.dentz@gmail.com,
 marc.payne@mdpsys.co.uk, marcel@holtmann.org, regressions@leemhuis.info,
 regressions@lists.linux.dev, steve.lee@mediatek.com, tiwai@suse.de
References: <20241127231432.8112-1-jglotzer@gmail.com>
Content-Language: it, en-US-large
In-Reply-To: <20241127231432.8112-1-jglotzer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

John Glotzer <jglotzer@gmail.com> wrote

> In following the related email threads it seems that this particular email thread has
> not had any activity since 10/21/2024. Now the focus seems to be on firmware download which
> in my admittedly non-expert opinion seems to be not clearly related.

Since then, it has become apparent that

- The issue affects many laptops that fail to resume from hibernation 
with recent kernels. It is not just about wifi/bt mt7922 combos attached 
via USB, but also and most important those attached via PCIe, e.g.

MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter

- The new firmware (241106...) does not seem to solve the issue on all 
the affected systems.

- it is relatively easy to script actions to kill BT before 
sleep/hibernation and unkill it after resume, but they are suboptimal. 
Users will typically set them up after multiple failures to resume, 
which often means after data loss.

Would it be possible to (at least temporarily) revert the changes 
occurred from 6.10 to 6.11 that triggered this problem?

Sergio

