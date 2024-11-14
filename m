Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571CF1F76B8
	for <regressions@lists.linux.dev>; Thu, 14 Nov 2024 10:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731581771; cv=none; b=VLD78wYkFAaCPCArNYcuw7s1ZuEtzMfCSeOw5+9bIE3pxTRaABQUMkc2TpFgd85lYkvu6pzYMZgyj5FE10+dN0m+zz6Zmhf5so9mzWRdeB/iRQXQcQJgcVFfRFuCOc2mM//XjqHPmuiFm6ZpPC5swgXoPm1HZSDX+lGPeYxTrHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731581771; c=relaxed/simple;
	bh=gsC8e33m5bmfHPkwoaayt4sYjT6yq/Y33Q5Ol3ZRHOU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=kg8JpnC0AUMd2EVO4H/GeXpI9clI33xiKxHVsbCzv3DTYt+AHRx7izbxwVycPpdGg99OvgR8c6bmsZPPm5PPe+9pFgl7WEXioy/v0tvNMteWxPJuLoA0eveWQdz86R27QtVln7E+OT+r0l82fBqzF9jRabbkFVVXP/25by7V0v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JkPXmCVl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JkPXmCVl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=gsC8e33m5bmfHPkwoaayt4sYjT6yq/Y33Q5Ol3ZRHOU=; t=1731581769;
	x=1732013769; b=JkPXmCVlfGLeG+4iFjAn5RH7ef5vLxVr4vAujAwJc7IiT2RAZxSPlHT7OxS8H
	Rrv/qONcfoxxiShQJvg0IIq5MhmOtZ+o94tM+b24sM5Fa+pPl3jcXyYiKqX1Mq1s5Zsu1emAm0J6V
	ztGNVC+2dJhYtuU+xOwQiZEdd359aDb8evI+6kJkjMfRKLcKpT2NYKrL7SEg0lc2d2wccfxtxQc53
	07VtD89INqr3fI/jsRPaJMHANB7xoU+R9whQZOblkQkZuocWcWnkZ9uhVYthRU7SLYxeML5D6WuG8
	rqoeUpqyAIpoJ2W/WzQjmzqaauBwb95+x3vj1AXLP8kTPlbOhQ==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1tBXWB-0006jG-6s; Thu, 14 Nov 2024 11:56:07 +0100
Message-ID: <753d0f67-1df6-4b36-a8cc-2f0059c70980@leemhuis.info>
Date: Thu, 14 Nov 2024 11:56:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731581769;5f0cc503;
X-HE-SMSGID: 1tBXWB-0006jG-6s



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3735
#regzbot introduced: 338567d1762
#regzbot summary: drm/amd/display: cannot set output mode to 4k@60Hz anymore

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3732
#regzbot introduced: 7a1613e47e65ba696708
#regzbot summary: drm/amdgpu/smu13: audio cut in and out at random times

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3720
#regzbot introduced: fa57924c76d995
#regzbot summary: drm/amd/display: slow framerate on monitor connected
through USB dock

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3742
#regzbot introduced: 58a261bfc9676
#regzbot summary: amdgpu: wrong frame timing/jerkiness with 120Hz display

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3705
#regzbot introduced: e047dd448d2bc12
#regzbot summary: amdgpu: refresh rate above 120Hz no longer works.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3693
#regzbot introduced: 1b04dcca4fb10d
#regzbot summary: rm/amd/display:Interface freezes

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3690
#regzbot introduced: c8c68c38b56f4
#regzbot summary: cpufreq: amd-pstate: incorrect CPU power draw behavior

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3638
#regzbot introduced: 4de34b04783628
#regzbot summary: drm/amdgpu: graphics corruption, rendered text
disappearing, sluggish desktop


