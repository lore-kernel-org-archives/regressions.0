Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660B7212B30;
	Thu,  5 Dec 2024 10:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733392893; cv=none; b=YDKlCFo/fRVgViV2pcFahanh+gqPAeDKCuf9EMg0yloFS2mVpP2TsILlq9czDYOyzODvBCWQAjmVcV5q/NCPuu8ppzJqmY+1O/cWYghXX24M/6YEMbeJ2uHX9QBpyu09NjS2bMKkAjtK9zxCuiYn3byZmtt0oqo2Vw8DulCGahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733392893; c=relaxed/simple;
	bh=v21otZvzUkNay7ZFsI1Y15KNxaF2kIaTH+hEyosvgLo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8vmmUhVa5Pp6+e+lrbzocFRHRlOb6Vfhxo7pgjiqULI2Ve/T1LT6nsUglZiTAUJluIwtbme55JSm8mdhYo50qyxQymPDi5PPJalEXQJKyWQ+qhUznLVaGhTUC5DdI8uE188rS4dKh72I1gg28neupnfD+PhMARxSu4LLtu9tsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImOjY0R1; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImOjY0R1"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa62f1d2b21so16443166b.1;
        Thu, 05 Dec 2024 02:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733392885; x=1733997685; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b6DpBiLftEN8D+gl9wRNAAKrPJWYeb4y6zIoZbJxWJY=;
        b=ImOjY0R1SZ7Nkmb+CC6wGfxNlrK+/747dTDUbyOqv/7w0KZ1hqKYGJy358ebQaYHwz
         W6eWOe7Zn4tLmnzbc7rKNeOEgq6K6kp+3aBhyy4ipvUbUuisNDskm3uRhoIMvGnYPeGY
         I2kSul5TtfSdK+3wWBtEGLnr55O6jKrNtYlYx3UNW17WL4KMA7OaqkHZEoqpVeqyBrdS
         NU+tSKLl9x5I6DKEmngRgsDfZX5ajkP8BAPT2LW+HxfF0vz1CwaTggY0Z12SUw+G3JwY
         Eih/U2qPJ8grUP6yGBcBcew568N3kIW/iTJ0DjzOQLWVR6cybxCvPCozzdtfm1PuD6kc
         y68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733392885; x=1733997685;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6DpBiLftEN8D+gl9wRNAAKrPJWYeb4y6zIoZbJxWJY=;
        b=qLbIG0hG7LoDDwk3vHVAWSoHsAlG57A2OSzjrXZ/7mJ5Z0bX070VoPxJ5C9jA4XfYe
         dE2Y4mKh0gRdeIytmoaXj4jrmiuoiFctv0RaeQE490AEJKVZRgvWFeS3QfkHFm5mtdcT
         y1iB+cwWGu57XWt94jjQ2pKA6kYRCChkCHNP0rEpmEL7mkEuGhzx7cBFcKsW/Klg4KsG
         /zmfUhVAx5Kgt6bESshQKGSUjPgmc8oiuMcLFlCxhP8opWZU1nDYAj7DlO2QjWUdgpVU
         3Hb1iMi5cEW6xfa/fone6XPP+/Evp7t/Mwoxdef60geqB5TxIDxqMkkt4oxcZ17Zjh23
         SeSw==
X-Forwarded-Encrypted: i=1; AJvYcCUe02qohpMaWgVEarIrTkDRgaoavGoOqpmzQgUDnHRIdHdyWVQp6nIJmZKInYNWkNmsZ4SwUIDAc7CIY1o=@lists.linux.dev, AJvYcCVEIJHYieGjNo/Ux+W96L2npSMRjTbMdiiQaGgbMhUS8OjnjvgGK8KBUCPL8SNOVFe4p/q7/u/lcEkMYmSpViY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq8y7p1rV1kBVgbYJJH3w4XdQJscqEB/m/vBu3SNIWeYn+KHpJ
	zRVq13Y09f3ZZW/RdohVPgNRLQEDtxKi7UzlH/S9PjwDOCWXCtqq
X-Gm-Gg: ASbGncucOFxz+okrK17QEU4P5qPatO0rszs5NWyTYERynpGBhX6CLSBiZV84yZYESfY
	omD0vMplpo02xXgMvLw4qVMvHT79kMvXsqoldqyivS3p+jBJ+JU6OM+n+C/L4fGRajbs6K3rL79
	AdVOAT2BayoNo1SLlcYHhQcnQflvuNQw0uKKvICrUDUo7sRDDkmKoIuhTivV7eRb4uqNnCCIbcY
	Gz7LaUkijF7kMcRtAPDJiOax+ED3n4m0ePj9jJ0w2IYpwwdywPQXZi+m3I8UfMmzn+mtL7/T2Pf
	dvZ4cseF1fsZr+zGw40jHrw=
X-Google-Smtp-Source: AGHT+IG2gW4KauIAqc9H7+S/c1RnImhk15kwQEK5S81eH+MUP7TMqxZDW5jHMC2Ra3qDuj0UirKvug==
X-Received: by 2002:a17:906:2929:b0:aa5:427e:6af6 with SMTP id a640c23a62f3a-aa5f7cac468mr695125366b.3.1733392884726;
        Thu, 05 Dec 2024 02:01:24 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e4dbacsm68854666b.16.2024.12.05.02.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 02:01:24 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 5 Dec 2024 11:01:22 +0100
To: Laura Nao <laura.nao@collabora.com>
Cc: alan.maguire@oracle.com, bpf@vger.kernel.org,
	chrome-platform@lists.linux.dev, kernel@collabora.com,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
Message-ID: <Z1F58qzclMgeEMcC@krava>
References: <90b3b613-8665-425b-8132-5b9ac86ab616@oracle.com>
 <20241113093703.9936-1-laura.nao@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241113093703.9936-1-laura.nao@collabora.com>

On Wed, Nov 13, 2024 at 10:37:03AM +0100, Laura Nao wrote:
> Hi Alan,
> 
> On 11/7/24 16:05, Alan Maguire wrote:
> > Thanks for the report! Judging from the config, you're seeing this with
> > pahole v1.24. I have seen issues like this in the past where during a
> > kernel build, module BTF has been built against vmlinux BTF, and then
> > something later re-triggers vmlinux BTF generation. If that re-triggered
> > vmlinux BTF does not use the same type ids for types, this can result in
> > mismatch errors as above since modules are referring to out-of-date type
> > ids in vmlinux. That's just a preliminary guess though, we'll
> > need more info to help get to the bottom of this.
> > 
> > A few suggestions to help debug this:
> > 
> > - if you have build logs, check BTF generation of vmlinux. Did it in
> > fact happen twice perhaps? Even better if, if kernel CI saves logs, feel
> > free to send a pointer and I'll take a look.
> 
> Thanks for the pointers!
> 
> From what I can tell in the logs, the BTF generation of vmlinux only 
> occurred once. The automated build process in KernelCI generally involves 
> building the kernel first, followed by the modules and other artifacts 
> (such as the kselftest archive). 
> The full build log can be downloaded by selecting 'build_log' from 
> the dropdown menu at the top of this page:
> 
> https://kernelci-api.westus3.cloudapp.azure.com/viewer?node_id=6732f41d58937056c61734ab
> 
> I do see some warnings reported in the logs though:
> 
> WARN: resolve_btfids: unresolved symbol bpf_lsm_task_getsecid_obj
> WARN: resolve_btfids: unresolved symbol bpf_lsm_current_getsecid_subj

hi,
this is fixed in bpf/master already:
  8618f5ffba4d bpf, lsm: Remove getlsmprop hooks BTF IDs

I can't reproduce this as well, will check the logs you posted

jirka

> 
> > - can you post the vmlinux (stripped of DWARF data if possible to limit
> > size) and one of the failing modules somewhere so we can analyze?
> > - Failing that,
> > bpftool btf dump file /path/2/vmlinux_from_build > vmlinux.raw
> > and upload of the vmlinux.raw and one of the failing module .kos would help.
> > 
> 
> Currently, KernelCI only retains the bzImage, not the vmlinux binary. The 
> bzImage can be downloaded from the same link mentioned above by selecting 
> 'kernel' from the dropdown menu (modules can also be downloaded the same
> way). I’ll try to replicate the build on my end and share the vmlinux 
> with DWARF data stripped for convenience.
> 
> Thanks,
> 
> Laura
> 
> 
