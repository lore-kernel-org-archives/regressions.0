Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794480348;
	b=teAKiLT82UKZMq+vEHR/Uwg2LlnFecgJaHkFus3/I7w4M95H0M7hqqRZDKl9FzTUfTvf
	 aoKNi5OJPwKnUamwIjMd/vsG+HZf7vCajA3kNI1Kz7iH5zysvdpGgJDCGrcEJv1ZEd2Ps
	 8/sOwO0Kb5zZi+tzPqwm6naObtRQ8Hy75zhG8+tHgq9zKuKv0HZqoeFqfc9AIsQ0kOOhQ
	 ajRu9gx/YKnHG5ajLWusV+mSwbrcM4o2htxlBgemdF1kI5WFvhl+bqLqSZUR8JPV1uE/z
	 CwFflFBj4loK/PJwb9gNpSwArYCnSwZr9M/VsNAJ/vZYvfVC+PDSrbXX4PFFktzJ1Yw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794480348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
	b=MnJhDNsbsShf4FgSiKovb7mUlB8xLxyq2gzwzjxEhmc3l5abKncIups158oCwMvx7dUV
	 t7LdZSoxkbITcVHNwCGk2SBHEZlrhFkqaCBab2YvaYuAL5ELfu+vgTlomPqdWw0UDdrkW
	 f3lASVRYDx7sX6zOVCcDkzLf+pFbF6vwkv8z3xVX7NFAzBgOsLRBGC3PyqGhxhUz++QmG
	 I0/IUAksfPYwjFpbcd7nxaUZ9al+8SZnSLKV9+KqVpg0FuYRAizjSw5qfWI2CNW6rold9
	 14UeJJP4xgS2Fl1T9wfX42Z/nHa4e+vZJHWK6sJaIx1uRC4Ge1TRe/gqEOV2V/Qywuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbATJpmE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72AA606A8AC
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 10:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72AA606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbATJpmE
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-716ea2598eeso2429454eaf.0
        for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 02:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794480347; cv=none;
        d=google.com; s=arc-20260327;
        b=LYqba2I/PWp3v4B9EKw8uhRGARigzJrlPC16N8BB1bpv6B0EEw5QyLunOSOoats+n+
         Hsruo11+KSnYvAWmIexC9OyBFx/un8fgHMCjhexf+w9lOSP2q8WSYURne0GhC+VKrXly
         jeYEFuTscCMztcDuqcq3v6QLrYGuuD8Tl/SfrvFsH5gCnYD/tJ9vAP+kxSMlyP8c+d2L
         bxzLI1SYrhv+w5SEuZw/MuFS0vzH/IoFK1u2+dRqsILW15IZRPNRobX7S3/b31yr7c8j
         O4kGtv6GRp6oi0DJpXPtFNapelXKBoe3s54Kkxcuybcveeuw4eYw3aFPRHiFfnLVr4cf
         XLdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        fh=UWAWrIisON2KTjVC8FrT6SztAaeAkCFKwgdJvnJ+Cn0=;
        b=pddYUBoonsJQZ9jXb48P/BWgOwsFOte2cZEL5uMDF78sI8kUL4a2M2MZ6MQaIkyNtK
         Vc5U0lQTRCdXqh+OgDWhr5vg3a7ht1gPb93N4IBXOd2gOcWQyAk8aLj+fcxqlZstsk3y
         +6xY6bXywe9qFYcue1EU6VpBEJcrcNXwNmji6ETUg/UncKBNzWj6fDQT01Vzqk+BOUuN
         c1NxE5m7uuok8tJVOzcvSdatZMZj+7VdB5M8zFkzarBsmugHjpLb1x/g7TP5uTxi/TpV
         ajbBUEAQ6Ihqu+b1veZkkLWCOsSUlehnrJxP962FAXXMC8x9YkFF4wNefYv8YfGhWUxz
         xO+w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794480347; x=1795085147; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        b=UbATJpmEEzGrt26RN2XQwabrf4s6XkSMV5e9/e4rLFGRMVSLUle4LTM3Tj2lBLerLk
         mC16IS7hMgXXC7cFySERAOQz+5+c9bICrJUCCfoE3A1OiZ053wifF1v0+GVDZRzzFumU
         gBvBjHQZQHKp8vvOhypMmDCGmOAYUYFWNM9Ut/aOcx8CvtMc9oXdP6U3V9lJJv0H7GOT
         HGCEhIzjPxCqHnag3saT+sB7b4rvLYfMBE/VwwHaRAx1OCLQJZRn7PFrorwh9iV6/eNw
         dHVu8K2OmCyST3HfC1zElZ7c98VSQgEJBhh86Xk7GouM84xqxk9y2ylDbz5nDFH0pWhX
         AoZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794480347; x=1795085147;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ddYVXCpBhwQ+2ajmiZG9m0k4vsq/lXRN7BsHqaZoQkw=;
        b=bKXh1cK4rbkngW9TPbvV1kit626U/EKYdnovEy2E1Bk2ucgA0QYKmWuQl6iFCb4Su9
         6PEHnaMeJL6SoHju9spqBPYj3UQJBs9zdJyIerMJEkdtC2vlUrTT6DBThZ+JnVGEi1t/
         IqPv+wJFsBo8sSGY8DGkROHgrUWqzGJU/jSBBzBq6ocMC04tyRof7BpK0k1VraZvHnfQ
         KOE+4yVHX6NpazvlEdwxTUPbaIO5Se37xSB7tJoJBHDqp98qpv9tIQL8xefD77tqzR7s
         GaoAxHLjxrpUCNVpOXU9uimF4v9iI79K8+ICkszwkzz6mYr+eg3sz5wgWlPNUgmwE/Nx
         4LFQ==
X-Forwarded-Encrypted: i=1; AL+hErEAaoMce1q+0MdL7/aaqebPR8KFcTEBGLa244IDi2ch1Gzq714wTPvQLVgU/XI/Hd/V0hpHI23H0Zfydw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9vXWmY2CuzQRHRWq3voOfdoDudAiM1PhzgpIcllai9lap5ii+d
	d0atprdyGkXFZnfurKbJYjuM38jrfZlmYvGkuR3oLA0BUtMjzZzHlCRWWrCVcMJBPF+TCekpvNr
	Qshzlz9xbwZU9/LzoYX4Psx8FGLz9GM0=
X-Gm-Gg: AYBFou3hPqOdKQ4ekcC/0WQyWzBusjn8OadEx8PWVHdpZrTv9NhtlVsn3PVddfCyzVv
	K3gM6dc2CEjj8da2TnYZCs737sEkxJReZkbCz8ML8ZxbebzSwG3Cje/qeYFV2uzpdqkQXCZfeVW
	gqoJAeoFqFtzc0bVwnkaPFg8aaimpjau1qtl5TVbk/CqXON6p+l408ZMoKZVjpylwMkxrvisjfP
	n6JDEnm1UKUAoF+0AvSjVM+jXOJ4yDgEUwImWnNGzBMgQYv67fpf3JWWRdZHCYc3RhKAhorU1eP
	0SWdL3r7JNOiNAUMpXUOw6Hx+YCfxtat09Ger63Ef4tfsd/xUQWz97Vr2RDteYvwjpGO7QEHK/f
	QUrJt4lyZF6OPlROevVaxZfiemfHnWfLWcWnyk+8=
X-Received: by 2002:a05:6820:1621:b0:70d:77b7:6879 with SMTP id
 006d021491bc7-7191788d816mr3318135eaf.36.1794480346869; Thu, 12 Nov 2026
 02:45:46 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <avA1wXhTMs9eY2NF@chrisdown.name> <6B8E9261-3FF8-441B-8F47-7D35834A8D35@gmail.com>
In-Reply-To: <6B8E9261-3FF8-441B-8F47-7D35834A8D35@gmail.com>
From: elenchist <elenchist.dev@gmail.com>
Date: Thu, 12 Nov 2026 19:45:34 +0900
X-Gm-Features: AclHuK8UhlNcIj8rZxl-jPAQ-TNb4Ro929pQ1QbaMvl25O9AF4j0sdfra1fF6R8
Message-ID: <CANYAW49zq97w7ptUO6xkXZ3e+CNMzWH7qxQ1bQu4an1L6_kXuw@mail.gmail.com>
Subject: Re: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM victims
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Tejun Heo <tj@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>, cgroups@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, 
	regressions@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

My mail client turned the backslashes in the reproducer into yen
signs, sorry.  Every yen sign there should be a backslash: the printf
format in overkill.c ends in backslash-n, and in run.sh each of the
two "$" right after "echo" has a backslash in front of it.
