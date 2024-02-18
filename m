Received: from devico.uberspace.de (devico.uberspace.de [185.26.156.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E34CA34
	for <regressions@lists.linux.dev>; Sun, 18 Feb 2024 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708218650; cv=none; b=ja/VY5/nSKnyZj7gOMhGxNkPNi9+ZXrtazcopx5D18nPl7hHOQhSWIO7CoPUWZmuFXs8gFsVXFCNcwg8TBgDZ18mTgj1XK9TTBxmmKd4fVoaLIIToMg6MOpEKc9uZvO36YylM+5nP22GHlX0hhDpPXzCHElTKfaoI7qFfvCEFJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708218650; c=relaxed/simple;
	bh=5oedLdsqy6OWfXEMO82O5bny7kMtEr2OWUJTn0tyfy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=l/zPg4L10516wIx0VrpaDvVb7oP0R5acMRJVh6PzoOLM6vYuVNkEoRrgC3fGOTmsnpuw9KRt6CXM71xaNfMPBpvKXigY6YJAY9wY3EQ5qFR9BrMqkuWS82WynW+i9NpIFlaCCufjPFNNXUuLRYUky6LfVWgaZ2N5h4qyVijgctA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl; spf=pass smtp.mailfrom=lausen.nl; dkim=fail (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b=R4fZS/B3 reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lausen.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lausen.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lausen.nl header.i=@lausen.nl header.b="R4fZS/B3"
Received: (qmail 3207 invoked by uid 990); 18 Feb 2024 01:10:38 -0000
Authentication-Results: devico.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by devico.uberspace.de (Haraka/3.0.1) with ESMTPSA; Sun, 18 Feb 2024 02:10:37 +0100
Message-ID: <85581fad-da8f-4550-a1c8-8f2996425dcd@lausen.nl>
Date: Sat, 17 Feb 2024 20:10:33 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [REGRESSION] sc7180-trogdor-lazor image corruption regression for
 USB-C DP Alt Mode ([PATCH 0/2] Add param for the highest bank bit)
To: Connor Abbott <cwabbott0@gmail.com>, freedreno@lists.freedesktop.org
References: <20231207213048.1377147-1-cwabbott0@gmail.com>
Content-Language: en-US
Cc: regressions@lists.linux.dev
From: Leonard Lausen <leonard@lausen.nl>
In-Reply-To: <20231207213048.1377147-1-cwabbott0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.824112) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.914112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lausen.nl; s=uberspace;
	h=from;
	bh=5oedLdsqy6OWfXEMO82O5bny7kMtEr2OWUJTn0tyfy8=;
	b=R4fZS/B3RJlZem7AJpmOdVxzVV85hLEU6hzl7QJJFbwBdw4Hb1eJxkaBXLbGpvEBc5iF0O88PS
	z0eBNOPTaKnXGqaOwlJMdrzQXq2lkeRhpMnQ46GfkUtKhmfbhwXtWy+VGIQEYyiLfr4srYXgQhWw
	F1PjVxNlKbaNqYk2rFSl7L0vDrvWjKwUQ+3Gq66Yy5MKRYvLhvDor7tCw/ZvmDvIqKMXCLAN4bsh
	zs6LXtzmkv5jeYk1keDiRUyGWkfTTt8BPL8AbAmbu9DIAiMNJg1celwlcsePwU3df0dhC2IDR27F
	94MflZLwmg7O85isI9ZUfk0d18SaYDGHt9vSdVdVM+AAcXwYSPwj+XBNGrMcWQiEyOHmkipNtMBo
	TC1o2R4llXZggcDKlQ4oz2lK8/u3d6qMz8YO4XQe/3qOJpznAktM//In4ISOEmPLUgTowa0cHyfN
	SKx7PJCUVXLegzKIF6JqzLP4RQdcTqzEI/4Ld6+sRpVZFV6SUAGtNZD7466k/xPSUwS7/SG6N9sb
	IKc9PNsadvctn8O5rmlG8vxhr6jchQxrMRhbh4aF/UZ8TLExV/ImgrUPwr9j8K5O11BKM969BAS1
	Xn9ibvbamCsr5kQdgRVke+ICteozmXMj6GheAyzBFcII1RQaDaDslTeNWiGK0uOrrXZaCWg9Yqiz
	U=

Hi Connor,

unfortunately, your series https://patchwork.freedesktop.org/series/127529/ has introduced a regression for external displays connected through USB-C DP Alt Mode, at least on sc7180-trogdor-lazor devices. Do you think it's possible to  fix this before the 6.8 release or would it be better to revert the series? I'm happy to help testing any fixes. The issue is also tracked at https://gitlab.freedesktop.org/drm/msm/-/issues/49.

Thank you
Leonard

#regzbot introduced: 8814455a0e54ca353b4b0ad5105569d3fdb945cc

On 12/7/23 16:30, Connor Abbott wrote:
> The highest bank bit is a parameter that influences the Adreno tiling
> scheme. It is programmed by the kernel, and is supposed to be based on
> the DRAM configuration. In order for Mesa to tile/until images itself,
> it needs to know this parameter, and because it's programmed by the
> kernel, the kernel should be the source of truth.
> 
> Mesa series: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/26578
> 
> Connor Abbott (2):
>   drm/msm: Refactor UBWC config setting
>   drm/msm: Add param for the highest bank bit
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  21 ++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 101 +++++++++++++-----------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |   3 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |   9 +++
>  include/uapi/drm/msm_drm.h              |   1 +
>  5 files changed, 82 insertions(+), 53 deletions(-)
> 
