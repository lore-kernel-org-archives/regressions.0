Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0114A285405
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335047; cv=none; b=V7QzkwuvVRCMQwY3wFYsZQ/nSMki/Ykz8cpjYwJWiU+zDfO2TTmwcgcNnAs1zB1VQR4Ip+YEb4F5vxwlEzGRg6C2GoB6rqbveeezQ8a8TzT/ChANfRSvRxhvsa2Byp2kbwKQDB4Tw9103yNMkWPKEooTnIY3AZt9wS0BAIPh02k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335047; c=relaxed/simple;
	bh=Ws8/Z7Kgvnnt5oC4+iZ3vidlwcn919kh/dai80ylbzM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cAZcrdHYMN9n81ox21pid6r325n2xUUVa8pFMb+VXOILbrZnIQ8HTm+0NFyIwbIJUFLKYINxTA2ErzsZ1BF8KYhwb8x7jRBEIQOnhcyp32dM/LhjKvoYWoEFJR7FvniBHeaRuP4fE9eozvLYKmAcGwucj9bLijIzjSMxTLCcoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQCJIgj6; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQCJIgj6"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7376e311086so1669111b3a.3
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 11:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335045; x=1747939845; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ws8/Z7Kgvnnt5oC4+iZ3vidlwcn919kh/dai80ylbzM=;
        b=aQCJIgj6QUVrYmNtcTXJrw+brXAYWBHRtsOqd+DjtJxwtVjvVH8BPLEO34VDan2jZZ
         rnSxD5t20TQsS1J0ciK5efWetnXwIVz3253LtcNsxpm3X0yPNa8iY/TCeytGBskNUvqZ
         ThBPo/px3b0UgGk+hJkPwZN2x+UO/u0l6yCvfAr2NSOOQbNtK2vi/dST119wLzujCngG
         QSmxSMAA4uzTVLsrzyugkjQ8wTYBFQd9K+RDr5ysnrUL6M/9QJEb7mybs0+D28O5hQkV
         QGqdzcIx1avASG/MSllEZdSzPCayz9RrmAucGffHJIcZ6ARxGE1A8nnhr9ut3jXiMm7D
         RBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335045; x=1747939845;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ws8/Z7Kgvnnt5oC4+iZ3vidlwcn919kh/dai80ylbzM=;
        b=J0kXKzNzU1Ow7dNyneIFXwr/+OpW7LarUHs1zphclDv3Pp54YOP6+z7eyguD9u+OIY
         CIl+EohetxyJg6QCYNLyjbc8Wx5F1Dr10jtiQrseGXJcXcXqHjBEuLf+CitOY97vNPRe
         M47G2sZTzZTLBymqlvYt+0dPVLjnFkuokUX8BAPc4Vgfr9GrTssfUuq6aBGX0SHzy/NJ
         MvXXpTbhH8THZPD6noVNnhrb+lr0N8n4V/Pka5hxU/Smtt+9LHERIcKLNbYlwVk7o7g9
         3fDRZ90dX3uLU/fOed1udcJ9Ry//NLVYHhzwuVRM48MibZbDMA9U08hLftYcbUvCCX/E
         HcOw==
X-Forwarded-Encrypted: i=1; AJvYcCVWgTeNhMNf3lOtkS5Z7UwxCLo7CxMB3aLOmXPjG/kZF/f5ecGHiwvVZ8yA0Haj0HD8FDN37wOX3aPBuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJfMepauC/JXdJDuPBJj0Iylz1dCROawh3gaCeNQYujNmVr05A
	VlnBkDz9gG4Bp4imAdUHqlvZlxvgKsFdey0n/tu75NCi45U+9OGN9pZy
X-Gm-Gg: ASbGncsGgsQvFq2c9WEf1HL7ZjBlZYC/Cr1gjJhzXv2SKV/RbmzSFqfiV7Ogsgr8Iyc
	cvxcBzqqT+UPFzpejTq7UrlAj7grwE7ldDzhiFEqbJhzEDH9sDjRWG5/1Zt+I388BAP6/DQogsz
	KjluIqeG675Z59gruFPkRzHV8zt8kfVU8GP39w3EMtzCdbAFWlb7mYf4UvLufZucMqlUGpOEfUX
	qPL824jqHf06WitkUGcOv75InOt3j4+LL+gugfNshYCs5Iw/gLMBQzC7jJx6qcsfXmjEwoZIhrg
	gEz6e003nBsXIPfFZv9Gf4/4g4BCGMdVwCGIKw5YIGiS72Q=
X-Google-Smtp-Source: AGHT+IFyglqdQsJAvhEcHUgfaGZ2S9LjIKZpapciKX/19nJergmaqDbkE4Y1cB3JY49TnJc4utrqKw==
X-Received: by 2002:a05:6a21:3392:b0:1fd:f55f:881e with SMTP id adf61e73a8af0-216219f90f5mr941597637.36.1747335044979;
        Thu, 15 May 2025 11:50:44 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf8a199sm214842a12.33.2025.05.15.11.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:50:44 -0700 (PDT)
Message-ID: <e3eca3902ed9a68c5732d1be5792be9cda3471ed.camel@gmail.com>
Subject: Re: [REGRESSION] bpf verifier slowdown due to vrealloc() change
 since 6.15-rc6
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kees Cook <kees@kernel.org>, Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Shung-Hsi Yu	
 <shung-hsi.yu@suse.com>, bpf@vger.kernel.org, linux-mm@kvack.org, Andrii
 Nakryiko	 <andrii@kernel.org>, Ihor Solodrai <ihor.solodrai@linux.dev>,
 Andrew Morton	 <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>,
 Vlastimil Babka	 <vbabka@suse.cz>, Uladzislau Rezki <urezki@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	regressions@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Alexei Starovoitov	 <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>
Date: Thu, 15 May 2025 11:50:42 -0700
In-Reply-To: <202505151116.4FFA176B8@keescook>
References: 
	<20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg>
	 <C66C764E-C898-457D-93F0-A680983707F0@kernel.org>
	 <202505150911.1254C695D@keescook> <20250515171821.6je7a4uvmttcdiia@desk>
	 <202505151039.DAA202A@keescook>
	 <CAEf4Bzb4LZK5p08t1y-32wAFDGoRGKR1w1T_je6+a_EOE2uSYQ@mail.gmail.com>
	 <202505151116.4FFA176B8@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-05-15 at 11:24 -0700, Kees Cook wrote:

[...]

> Linux ToT fails to build, -next fails to build. v6.14.6 fails build,
> each in different ways. :(

I posted recipe [1] some time ago.
Checked it right now, everything worked w/o modifications.
Can be used as a baseline for build environment.

[1] https://lore.kernel.org/bpf/62b54401510477eebdb6e1272ba4308ee121c215.ca=
mel@gmail.com/

[...]

