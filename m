Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371220;
	b=XE/Kz5S5ypK8tR6+lCyX1Cro+zS64IiYG+psCWFLYZU/D3wYcfUV7NOkGR28ZZ/p1T4a
	 k8ll5b95pq2FKMqd6GZNyM74ltpxVVOaftM0Y2QToVnt2IJJ0HcCtSQhko/gOi//G+9du
	 BetZ03efjVQkMw20a6zUNTyeJZeeQOO6Oyn9M8wCDPnhXaO52B/Ngoz+pq4mJs7oAA3Q3
	 fcDHqLVmW9UJJyWWcl3kGMiJRu/bzGBQ97dyIbsmstCeg1ID7svSjsgrSPezzv8v3V1VK
	 wxRaVHYnmPaWK4O62AOe6XIyrWAOCHyCYK84qGiFaZIwnBaqevHwjLUcbxemTIqkH1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
	b=JK5WAUgKYwpz5hwFmV/jhHFJzqdVaHUU6opCk7R+9SMlu6md+MzACQqmN4OMfGXJLuP4
	 7Qg1whxQZHIeIt4HH7Lyck7aXcAZqFIpPUfXTHC8DKUzVAXCA1Gs8Diguoo96KbK+zFbr
	 rDaLgqH7sWh237Qr1sMIJrIKyuU6xeH6rq7KoduwBUmpRN5kz3Rp57w/W6PeT6E0hreaz
	 WD1bwHv+7VfyTgXoXmAdXK3Vlp7LuatFRdPcmNLj+Wrhtq+lIEr72sgeIGNYrzbmqDZIf
	 w7yiGf22WKeNL5XF5Gsx8U5cIh+A8Ap8Di+l4Z0ijKLFQAh+AFtI6njtl6lTtt4hHKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdgR++6P;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0C606A337
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 04:27:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42D0C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MdgR++6P
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so4341230c88.1
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 20:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794371219; x=1794976019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
        b=MdgR++6P3OnG0nXJns0TBZYrp629Errd0y4GycG5GyKduCJui8BBvtw0Q52AIBn/3S
         m5ZmN6JOcUk6uZhl+kczKrCJxA4XFZnJZgFGMHt1ojMHCJNLJIpJ7cgVoAAUMA8aZa7o
         eHNHd/mM8urGgQqyzN21J973epMOrEVUrtfaX4XZO4HWhIT/9UvQDPrwJJgUsubbWpiW
         HSgTcPhYQ1loUo2hfTjWY4JXv06JwNVP7p5Fq56cp+vizFdpnm0wLtt1mSPYyrbN31WQ
         J9rhf6PKfsM/lWfEqzktuGT1YNrbJChkDnspoRXiAe5RFJd6qyP0Nhj6WWBH5bXQAo4g
         brlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371219; x=1794976019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y1pY2f18oXgCvPBL0khHJZDCXmLtKWWVDmpFe3/LPR8=;
        b=UDeDdVe6y41qa+TjXbpsHbHlqo4G/r4bINTUt03PwMsM1qQrIZb3957LrAkOhmeGHc
         9rd4mvPczCDwx7QaiZ0erMbq7fCeBqW0oxP0qEoqcJs6EyN6Wo6wtrNh9Sxv9KZAxF4V
         /FopZAK6INHLjOkDpCRE1IaHOjjP3M5S/fsYd6wCB0CeJ68K8R87VwTSoavhGaQDYjLH
         V1GjO61+dB5tQEy9cj9LO00yLoacyGeiKmjohoGX4QChemaAnkpv1Ea1NJz/PTliAzTc
         yzyxnxtpwH1G+a3KGGvGfbScOeMYC8wCq2W7JgzuxjiV4DZmY5GSWGYe6KSEch19w7/D
         xd/Q==
X-Forwarded-Encrypted: i=1; AL+hErGPueV/kzb4uS7u89O3KPxncJUJVGe+K/M9QLJCX+GOjfYauYKI9px5NOkOM2XHFhvbdcdddMDfMbFAWQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+GJMyZMrydpVEIqZ6h+rsxrU9TpA07Vi3zifkdUzBJAPYDRn6C
	rv1RUuCSA84pTH9oNainbgpWwuMnxx3rIFsglUQC2TqJE+1lBZ8bZwRW
X-Gm-Gg: AYBFou1MC+EXliziUNn9g9/+LSNtFD3Dx6PTV8WZLLT8G4x97o0Mxr7V4DVRyMoRG+B
	CjLyqlemBb1vVrvEodyw/FJ9BxSzyHqjN56OroHstmULWz3WpUkztCWSdyoxHzqQYzodqfhNhnT
	FSzXLsGF92fqWGqVVqCQESv+tJOiji7mvdPBDk531zs2AVzYImFkLCcgjhyVjnaU+OuUBeKpFiy
	z9e0RBZqAvpuF+RlF8Nipkq0Z6bE1Go9hhqCdsIejqRqmJOXeZDigCBQCPoT3SZpW8/5tIrMAl9
	Gl1u2OJ1kQNAnF76jmjXA+i1SBqz7kt7yjbS7lsdRNkto067D8h/ttXdtRv5LUvkzbuys5QDM9e
	L9sQntfsGCUxDChwPfI5gpu/yyCiq78ZFds/2gDwyrKqvi7czDkcWY20+svs0RSihwxWF+TlrtE
	iQTMUtH/uYWoOmnW3Z/hBIlSvlNMZn5dbFss8/y9/muhT0L+PPi3MBnN7+ksnbMY8M/ebbtHAJh
	zhSJbvv+cQUeVqpvRdE9XdVIUB2N/Y/2+s2ftmKsqS/cFVbikCxZdFs8uV2QMiCjf3D9c9ofnnQ
	SrZ0NTo4zU5pmZm/JvxGo9bLYYCs6EGRlHxcrgnqEFH8P2MWIBmJrguWmVN1yXYxDw==
X-Received: by 2002:a05:701b:2302:b0:1b3:a26b:8b97 with SMTP id a92af1059eb24-1b3c0353171mr1289026c88.41.1794371219170;
        Tue, 10 Nov 2026 20:26:59 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.96.168])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11563252c88.2.2026.11.10.20.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 20:26:58 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: jack@suse.cz
Cc: akpm@linux-foundation.org,
	willy@infradead.org,
	linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	fujunjie1@qq.com,
	vishal.moola@gmail.com,
	roman.gushchin@linux.dev,
	tracekotae@gmail.com
Subject: Re: [PATCH] mm/filemap: restart mmap readahead on sequential faults after many misses
Date: Wed, 11 Nov 2026 04:26:39 +0000
Message-ID: <20261111042639.191997-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <jwg2p4bjzkacnx6fkifkb5jbe7ah6btuecpcpulbkym6e23v6x@mh35p6yafmqi>
References: <20261105192517.228523-1-tracekotae@gmail.com> <20261109091444.128521-1-gopalmalaviya53@gmail.com> <jwg2p4bjzkacnx6fkifkb5jbe7ah6btuecpcpulbkym6e23v6x@mh35p6yafmqi>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue 10-11-26 14:53:14, Jan Kara wrote:
> I think this [1] looks like a nicer solution to your problem.
>
> [1] https://lore.kernel.org/all/20261109-mmap-miss-v1-1-8b44b33f3358@it.uu.se/

Agreed, it is simpler. I am dropping this patch, so the v2 I mentioned
will not come. I have tested Alireza's patch with the reproducer from
Trace's report and replied in his thread.
