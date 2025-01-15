Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23972101E6;
	Wed, 15 Jan 2025 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736962702; cv=none; b=nlyQ6idZSX5bu6zTvT9PsrZ53iqeyyjqs7fwP9PAoJQSpQ1uhWcXEvIRY6alRl7tq0rfxNF4vRz17gag9dDcqc2tCmH+DZWzVh1fjK7RERwgwmrKaVeBZ8htSUAklRoJ/ride5hXgDquLBl+Dbx8KsdsXbDYKwCAt3GaLS1TX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736962702; c=relaxed/simple;
	bh=8q3dKUnAbdu/O8CUZiTaxpUmetNImX1ysBcGf0/581g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QD/S0sxgIhXG2K41I8zF1K5Ufw1xdwWdykscjBcpSzdpb6ZqKdOyAqWXw3pckJE3+gx0N0nliQ2d7vRvBoT4LWUXPo8Bo4mTMDaappyCaSoKznffYQtSiK3RJ86F7YuRHgb61L5IM0d6e0Dh8sNF3rTazd6ufsEbHMuG37tVNUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ozhbgjiw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ozhbgjiw"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21649a7bcdcso122465565ad.1;
        Wed, 15 Jan 2025 09:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736962700; x=1737567500; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ffTN+8BxxrgtsYW9mnk7jYQ9FtHVNVrRyvbSAwFbRGI=;
        b=OzhbgjiwEgjtsAXHBkQtwOx754TUiCVfZmQlU41AXAQIVBf1PUNKrM2zkDZAnnOycH
         rdA9UeqI9eegXEp9jawX4vHVNUISu/70k2nmYfZTOz7g17Ju49SV1etzFwIapyX9VX0E
         Z2j7PV3PrJyubWT6fivXOZn8qaGcNyvpmK73jUKXYle3/poG97ZDmIERRFNsU3RRbpEG
         VtmulYFuc5eLM6z8rj62i5l6NaIWh6QoBoqePU0oAJVXykekY03KdT9EAgs2Pcx54gGk
         GpdFdHKW0f9y/bVG464IsWNloYapjnnHcts3N8hEQpJle8DS2IbSmJeDaMfSC2eNXTPd
         EpyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962700; x=1737567500;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffTN+8BxxrgtsYW9mnk7jYQ9FtHVNVrRyvbSAwFbRGI=;
        b=UpNNi3c5Zb8bWl9kt8cO+/LbiTiSQklRoL653CP5U1gPc1Hs2lDrXbZFg1dWWsOV9P
         bYKDKAQU6ROGDZBlydtxMJe997PFdnrWOucnbqb1ymiQFSbVv4M+sTtu7T6Ln333opNC
         qGxx6g5ganZY0WfHSg6S6tTrmWtdCuD4I5fiBNHlyZtr6jYIJfOQejClD8uhirL6kjvp
         GHPnfxG32VEu2k8Z59UlBP9l45DDYHtifznK2bEH3UxN86/EP0HfIXwQVTahsoWxYudZ
         4PnCDnnvbVwtiFzqbb2BICLkZsDof37LckZo/qaokRfHTGPZ3TfoMOzw+XS94WRjT7MI
         n5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVI7OyRfl4ppY0kN3fzcqDFiuXI5COx5VOVEw7VPpfVMUsR3VXJNA1P3Ib5G2kQ10HJnG5dyUWLkQ2vo9U=@lists.linux.dev, AJvYcCXFmuuJ9UVQ7zqXRM/v14g9IWLQP6uOogV9WqdsrEDO9qJ5gzMcaR9St+uII2LIec7WfdsS28d7APA9AQdASxk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyUzq+BqZ0B5esxbwhjkY8g8GV9gyJaeHm3puKVfzKalwSpUsg
	xRBgTdm/crFvlb/4nyLB0fIjUPjpK1tMSkaba1k0Zoyq5HuPOD+3
X-Gm-Gg: ASbGncvDjhPKT9cD8l4BoSxpZGvc+d2MgQkSixhLe29YKrfYhi9duxyYEoN6yGfDwRW
	hOHEjAJ6eJISWOQfpnKqLaYKqIT/yyupjXPHiuTwGlGGvY3qWkMcY6Xif6b5HR1uNFZAVXgcZyq
	cKkosyJYPfxu8JlRuD70pGGv9ydCJ9KBZCaSmxtTQFeRKwIaZb+IjyY5pQQy89TYfJ/41mjzEjO
	Ei2g5Rh927HhYxQQj/ex18PV/DtTy1hUhG5cLkdVOTkPXtG1IvjVEQZ8enQKiA=
X-Google-Smtp-Source: AGHT+IHweyN8ETy0hN0cfZvqN7G9Q8blcc9XGv+ulNoTPKJ0X3+8BdzOQkFAqN3Thq5VSuJTcAXEpA==
X-Received: by 2002:aa7:88cc:0:b0:71e:4930:162c with SMTP id d2e1a72fcca58-72d21f4ac63mr42651910b3a.6.1736962700388;
        Wed, 15 Jan 2025 09:38:20 -0800 (PST)
Received: from localhost ([2601:647:6881:9060:2b45:4736:5bcb:52eb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d405489bdsm9406934b3a.33.2025.01.15.09.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:38:19 -0800 (PST)
Date: Wed, 15 Jan 2025 09:38:18 -0800
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Alan Maguire <alan.maguire@oracle.com>
Cc: Uros Bizjak <ubizjak@gmail.com>, Laura Nao <laura.nao@collabora.com>,
	bpf@vger.kernel.org, chrome-platform@lists.linux.dev,
	kernel@collabora.com, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	"dwarves@vger.kernel.org" <dwarves@vger.kernel.org>
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
Message-ID: <Z4fyijoUoeTnOuDM@pop-os.localdomain>
References: <20241115171712.427535-1-laura.nao@collabora.com>
 <20241204155305.444280-1-laura.nao@collabora.com>
 <CAFULd4a+GjfN5EgPM-utJNfwo5vQ9Sq+uqXJ62eP9ed7bBJ50w@mail.gmail.com>
 <Z10MkXtzyY9RDqSp@pop-os.localdomain>
 <3be0346a-8bc9-4be1-8418-b26c7aa4a862@oracle.com>
 <c067bc3d-62d6-4677-9daf-17c57f007e67@oracle.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c067bc3d-62d6-4677-9daf-17c57f007e67@oracle.com>

On Mon, Dec 16, 2024 at 03:19:01PM +0000, Alan Maguire wrote:
> Seems like there's a few approaches we can take in fixing this:
> 
> 1. designate "__pcpu_" prefix as a variable prefix to filter out. This
> resolves the immediate problem but is too narrowly focused IMO and we
> may end up playing whack-a-mole with other dummy variable prefixes.
> 2. resurrect ELF section variable information fully; i.e. record a list
> of variables per ELF section (or at least per ELF section we care
> about). If variable is not on the list for the ELF section, do not
> encode it.
> 3. midway between the two; for the 0 address case specifically, verify
> that the variable name really _is_ in the associated ELF section. No
> need to create a local ELF table variable representation, we could just
> walk the table in the case of the 0 addresses.
> 
> Diff for approach 3 is as follows

Hi Alan,

Thanks for your detailed analysis.

Is your patch formally submitted and merged? A quick code search with
variable_in_sec() tells me no, but I could very easily miss things here,
hence I am asking you. :)
