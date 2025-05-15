Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2591284B27
	for <regressions@lists.linux.dev>; Thu, 15 May 2025 18:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333875; cv=none; b=StNq4S9by0wjAlgadmHw0LA5TY7SMXNvqsuUS5rNWd0Blc57WElqDu8EZ1cZ17AZnH+sGs5V0YF/5GXeA3LQmHaAIuxs+c1EIpo3ZqVjLS3JI91mDw6dmEZ+u6jnIgSkYBQYXPNpp3wB67TSZV7ulbzzu2Fw/t1YSCUhuqeCmzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333875; c=relaxed/simple;
	bh=V6rVl2MUL74b08/nShEq7cCkERzRMRshlzLbhmNnQ+M=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Xl/Plvux5QTSviR14IPcrEzUkhvIygTntfS0TV/anrWs6E02/5LlJzMFB414d0QC3q/y0tjuW0cd+miuGvZJsj/oL3WJXmECw335pnSoqlj9jQHllc9AR8SNPMh8+zdGsee0rHSpT+fmHquBArytdfz1mtQ22Wa3cCPl3WJJ5YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TNDy2772; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TNDy2772"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b1fde81de05so825921a12.1
        for <regressions@lists.linux.dev>; Thu, 15 May 2025 11:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333873; x=1747938673; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V6rVl2MUL74b08/nShEq7cCkERzRMRshlzLbhmNnQ+M=;
        b=TNDy2772/5BmUdEDo7m3z9EJGfd8/DU3cwou7vcW5dCHF1HaopeDKyt9EfsgSUNraD
         Ax6VKPC+ulS+r6xe3O3faPymi0yMxmwaZVnPDMuOutKwE5OriBiDxx0hmBfkVYfhrDWn
         ncaEmuA610PNcovgD+4khYnTchRwGaLpAanHB4AiywBd8MyHgwXQdzzRSgU4VV4owaJu
         tc38jSDHf1wbmO4Wxbd4TYlBCJjycL7sqtWSCL90TsaolbWn2bJmzj9d9KfVVgI/WCTm
         8LLmbqB7KCAT4HGSgY+I67EL69eglJDYyVTZqBmnqJbEQFCE4RMQi+PJt628nahjFW00
         eBKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333873; x=1747938673;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V6rVl2MUL74b08/nShEq7cCkERzRMRshlzLbhmNnQ+M=;
        b=pVbxzq+yVb83NE7qvevGEFGl4mQGJyQLEuxmRBVandzm9Zk2wwPcP82YdumdLobDvf
         9fzH6orodBPf/4OXDdao0rYH5nzZspaucjqqcYtjmhJJYdS1HkKdXbmNgidQYdaCBWyR
         r2R8slGGUadTXNV7tpuMvKjsc8O7rdZzcbBw/NJ+YMDxU1iXU/eCAYNZt6h8ppvdZajB
         f8wmX8vLlkBHCrz+AHb5H3hzqK8On8Tn8NGKWNu5tBrBk+yyzE+tEMz4jZcfkbxnzdmO
         8A/IJHcZQilZqBQ6ds+0tbajLqEZyA0ZwdYt4B1PV85YdQODzrS7GtMRYQz0jBkVfytd
         J4Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXoFBPAoablgwtVqb+cBYGKyRevYk0MPHCzOCWvV7GZv1E1sM4yD3eXxRgVkjYYeXTq2/erMgP6pgwBfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7sDZCPXohKxS45c/2NGHn4JYCLi7bsg5GdmQPEDwR2fYQ9ozJ
	G2yADx3kLYF0vJLo1WwQra3b3YkDEOVe12uw2BxNonIJrZypM6JIAVpW
X-Gm-Gg: ASbGncu25EKWp5VVrQsUxlDXJNllfv/3Nv/6Nxvi63+ZNWnYi3CfgZCFswryQh8RSln
	HzMpoeZHk8Qrc0y+L939sYBwM4j7ESVfnqC5vh2Y5vJTZ3pnSvP8PGNfKpIMITgzfn9ZKz08pvw
	8UfAvE9RAyCuJzCK95/rC1SUZXLn1YMpvKKZxZR0eLAMvD4Eh8NKBa/CliNdbg427VfRgbhaHH2
	A5RwiXyikdtVm7Kdusb8MzrfhMJZqNDZAPXqqcpIL4Kt5z9xIA/aOFSEe5ea8idSap3R0QU2bjm
	5XzOuCEkd6hENJxNWl2hrcur9958sYkMw5tt9545TIUq97yWyVHmtycM5A==
X-Google-Smtp-Source: AGHT+IH6OY+7lX78qJzXX8XUmWkJnOnPaGJh9q4L+Bcz6Vd9CB0IOhsuPWAb1U3MJhxd+KmPtBkNvg==
X-Received: by 2002:a17:902:ce87:b0:223:653e:eb09 with SMTP id d9443c01a7336-231d438a294mr6291995ad.7.1747333872812;
        Thu, 15 May 2025 11:31:12 -0700 (PDT)
Received: from [192.168.0.56] ([38.34.87.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e98018sm917875ad.155.2025.05.15.11.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:31:12 -0700 (PDT)
Message-ID: <c36245a48149a12180ec710c65d317a12cdfa020.camel@gmail.com>
Subject: Re: [REGRESSION] bpf verifier slowdown due to vrealloc() change
 since 6.15-rc6
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kees Cook <kees@kernel.org>, Shung-Hsi Yu <shung-hsi.yu@suse.com>
Cc: bpf@vger.kernel.org, linux-mm@kvack.org, Andrii Nakryiko
 <andrii@kernel.org>,  Ihor Solodrai <ihor.solodrai@linux.dev>, Andrew
 Morton <akpm@linux-foundation.org>, Michal Hocko	 <mhocko@suse.com>,
 Vlastimil Babka <vbabka@suse.cz>, Uladzislau Rezki	 <urezki@gmail.com>,
 linux-kernel@vger.kernel.org, 	linux-hardening@vger.kernel.org,
 regressions@lists.linux.dev, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Pawan Gupta
 <pawan.kumar.gupta@linux.intel.com>
Date: Thu, 15 May 2025 11:31:09 -0700
In-Reply-To: <202505150845.0F9E154@keescook>
References: 
	<20250515-bpf-verifier-slowdown-vwo2meju4cgp2su5ckj@6gi6ssxbnfqg>
	 <202505150845.0F9E154@keescook>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2025-05-15 at 08:47 -0700, Kees Cook wrote:
> On Thu, May 15, 2025 at 09:12:25PM +0800, Shung-Hsi Yu wrote:
> > Bisect was done by Pawan and got to commit a0309faf1cb0 "mm: vmalloc:
> > support more granular vrealloc() sizing"[2]. To further zoom in the
>=20
> Can you try this patch? It's a clear bug fix, but if it doesn't improve
> things, I have another idea to rearrange the memset.

I tried this patch on top of the commit 82f2b0b97b36 ("Linux 6.15-rc6").
W/o the patch I observe the slowdown, test times out after 120 seconds,
with the patch test finishes in 3 seconds.

[...]
