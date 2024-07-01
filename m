Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC4438DD9
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719876114; cv=none; b=WiO7c5AzV5yB+zRBljbLYfF4JAIHh9zbr60Q69QfRobwF+RiQC5PasXZlbbQMZXjvtdRJ+XYiCSFHzVSEw/QPbK6AUJwPhWTUCmAPU4+oQYd6yVirbUTzmcqyVhQ0uc6pDrJtJmeEmvb6KLOE/fU+p/dlYmlUPWidBnY5KPSIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719876114; c=relaxed/simple;
	bh=l161noe5d4m1fHPVwe7LFmqgbONJXsfZmxoUYVpLqK0=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8lIN9LMxa1mpZWuYY2uF9qREA8ePYa8CpMTUzBUP9r0H+2QVJ5JllWzNJmzlb+2ZZ3nJiXosXPX9whCSTGVQGYTnASEzWj+ThzeUl/Dpu6uzKuqiLE3OsHCPhZO9QtQFGfheihGpKrPI/vHRIsTY8lu8AkgSoraxMMuYIre/0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GnW9im8d; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GnW9im8d"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so21289385e9.1
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 16:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719876111; x=1720480911; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J4N/GP5VmiaJVWsKvPXL+RPq8dWI4QSa+5yYoGERr4Q=;
        b=GnW9im8dTCkMiVGdFA47kWsUQzA2nXi6lrZlt4eBTLOERRXwHAMg3DQxKPxWLYcSGd
         G8larDtsDRMUGpwvpgRVggdM0wfHqV6bV8EdQFaXi7DkqHGI/lTILFtqsLBSKbWTDSV0
         Vo1wJIB1zG4NKAbGcCe7e8aBQx4GFEfHv0jkB08PP3rg45lqIgB/TGnVNCVjJncZU/ss
         J4oIy8KzsSJKxi47YAXIMIDyBuZv+uEKOO+WaxiXovbXoi+OeVeupLW9Wi8SgzamQvfZ
         Ll0ZWbFs+GFC8S5BrzuljxnakMVvzeGWwRTZSrNRDCYRmb0dY2lTomxcSi+vDK5EAB9N
         qhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719876111; x=1720480911;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4N/GP5VmiaJVWsKvPXL+RPq8dWI4QSa+5yYoGERr4Q=;
        b=ptFagcHdmVZhF+HdL5bosRG5q6rfqm66E8B+TXEraKOi0shdbB1qFU6BRlvQOfdlCs
         sjbh8u7xnmYImp5ya4wO0LB0IgzxSuTj8g609+ZA6LnJgmzntqaNA8VgRvZeVNsrWglE
         SMpfv5ylnbQeqEiPbCFPKe866x8+Z4PjzgyCnU60kuYOy5u3tQM451dd0mttEg8pkFxd
         xG2nQYznobOOFnMfm6hUCLC6Ipud5rHSrHqkQ7qCOko5sp65EgJMLpOHYiBUi3vJ9fqo
         0uAKLE7W0VaXXND+Z86e/KIH28S5GBkWK7lw5Xo74c6vPCuZTp2IEj90vqUvTOo5bUuY
         VhmA==
X-Forwarded-Encrypted: i=1; AJvYcCWzvFmZEaTpYZfHc3i14scEIRn2U6EbSKhzQ1NUqIMb7lLRJcRam1+bwcI93O23rJlixeZf627S4nwlh141jRk4hSsDP+MJBPtVTeI=
X-Gm-Message-State: AOJu0YzWZcy+2l42WChZ9PGDxUGtKNODdy8vuzAT71G8tJF26TwHtXm0
	3SIBejjJiOMCXUPuxaKVwApX8bSBephogPzBLndriXfeG/rvuF7X
X-Google-Smtp-Source: AGHT+IFiJrVlOS6nSZr2vq22HUDj+b44fPA0H26+dRRG9DhHLPNlLhirN66WtpD66w7oFRyz+tXl3Q==
X-Received: by 2002:a05:600c:1d20:b0:424:a823:51d8 with SMTP id 5b1f17b1804b1-4256d4fb273mr88007515e9.11.1719876111076;
        Mon, 01 Jul 2024 16:21:51 -0700 (PDT)
Received: from krava ([176.105.156.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd707sm11374193f8f.1.2024.07.01.16.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 16:21:50 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Tue, 2 Jul 2024 01:21:45 +0200
To: Christian Kujau <lists@nerdbynature.de>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: linux-kernel@vger.kernel.org, Martin KaFai Lau <martin.lau@linux.dev>,
	bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, regressions@lists.linux.dev,
	patchwork-bot+netdevbpf@kernel.org, peter.ujfalusi@intel.com
Subject: Re: [regression] =?utf-8?Q?bpf=5Flocal=5Fs?=
 =?utf-8?B?dG9yYWdlLmM6Nzg1OjYwOiBlcnJvcjog4oCYa3ZtYWxsb2NfYXJyYXlfbm9k?=
 =?utf-8?B?ZV9ub3Byb2bigJkgc2l6ZXMgc3BlY2lmaWVkIHdpdGgg4oCYc2l6ZW9m4oCZ?=
Message-ID: <ZoM6CUhbWuAFuHjP@krava>
References: <d0dd2457-ab58-1b08-caa4-93eaa2de221e@nerdbynature.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d0dd2457-ab58-1b08-caa4-93eaa2de221e@nerdbynature.de>

On Mon, Jul 01, 2024 at 10:56:22PM +0200, Christian Kujau wrote:
> This has been brought up before along with a patch[0] but has not been 
> pushed to mainline:
> 
>  $ make allnoconfig
>  $ enable CONFIG_WERROR and CONFIG_BPF
>  $ make
>  [...]
>  kernel/bpf/bpf_local_storage.c: In function ‘bpf_local_storage_map_alloc’:
>  kernel/bpf/bpf_local_storage.c:785:60: error: ‘kvmalloc_array_node_noprof’ sizes specified with ‘sizeof’ in the earlier 
>    argument and not in the later argument [-Werror=calloc-transposed-args]
>      785 |         smap->buckets = bpf_map_kvcalloc(&smap->map, sizeof(*smap->buckets),
>          |                                                            ^
> 
> I always compile kernels with CONFIG_WERROR=y and I'm surprised that this 
> has not been caught by any build bots yet (or I did not see those 
> reports), the help text even says "If in doubt, say Y", so I'm very 
> puzzled why almost nobody else would be affected by this. The compilation 
> error happens on a Fedora 40 laptop, with gcc 14.1.1 20240620 (Red Hat 
> 14.1.1-6) installed.
> 
> The fix posted in [0] does fix the compilation errors, but maybe never 
> made it to the correct trees to be included upstream? We are already in 
> -rc6 and I fear that the next release will be shipped with that problem.
> 
> Thanks,
> Christian.
> 
> [0] https://lore.kernel.org/bpf/363ad8d1-a2d2-4fca-b66a-3d838eb5def9@intel.com/T/

hum.. it's in bpf-next and linux-next tree [1], but not sure it's
on the way for next release.. Daniel?

jirka


[1] 6f130e4d4a5f bpf: Fix order of args in call to bpf_map_kvcalloc


> -- 
> BOFH excuse #424:
> 
> operation failed because: there is no message for this error (#1014)


