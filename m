Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DF4380FD5
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 18:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791309750; cv=none; b=NQGZttTx0Ih/r4uqGe23F7rDnu0CP2aYLru0EUln9eyeFR24TJq7JIdsUs/6YcAAc3bzoBolwRJ4sbhpu0hx74rtoxQbYCHqpM9PkeSwaunrBJcxtBIoSHeyig150eHrzeDxvxJGrjj+ejDjvluHUEC5UmBR4t7+us3vhDQT9ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791309750; c=relaxed/simple;
	bh=jnlchJcNHOTA3hCgCNu/QH0mNd666/ZUs0I8Qyb/Cuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cLx1Lz9D2HQmyjPhwlRyqsgTSW/5u7LEx2fc0yX1FZuVWhwjPc2aCpDEA46snwMlUKBUJf+SQDsZHY2L7LuHC+rmv4gnjmxD1HLUVtxaKZrQ0s90goQ/NUYWL4OYDPqwJDyOswefk2FEGq5SM1bmtx3ZqgzH+St35anOdnC0sJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=iXCQQb7e; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="iXCQQb7e"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D42D03F853
	for <regressions@lists.linux.dev>; Tue,  6 Oct 2026 18:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791309745;
	bh=7VPKoVET0WZyi57RaxQihc41cTq7wyN7m0LKNzGgdxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=iXCQQb7eMUz6yrDWGGHjys9Hk8X8xESHiDdK6/Kw1dF0MeM+QNScH5KwV3Jiru7uF
	 Gx3XEEURkz68rqkJCfMU1u3x1Su+wX0EDsw8ifCOQsNsa9VrZukipeU6EbpAM33eUd
	 qnhBTHGGTwlKTqDva5gkhNAkYXEdKyHLP4BbTmeJo4xOImkJhWuSY3exE7Fr9biCUh
	 7+r+kaLSsAcg6vTymSB7zs1R3Ss636pEAaDQMCAzBn8HLz46MjGk9n0mgAZx0sE1Kn
	 q+0nQ6Whk8vMUozrz6XRNfAWeVPcVQH8L0lbWjbdmD/ea9KIUaDs9BSvoiWP0c0h7m
	 B/R2HL7ZZMV8Tez/1Ir+ul61vzohbnvEgHf9i2D5U4FEpd3M8K1Esncvoiid/2E0fg
	 z/ICOAD8F7rGui87lERnWMc+KiV5MQGvYwoxpW5BbJKt83cfA5DmKkNE6WHmfc5bpp
	 DIADmnf2lu8n8sIfIeV46b2gryI1Jdr9QwHDKEOQRsMe0CSddmP5AdP1CFfKqfFLI8
	 eX/Xq9fqh3ItsxIiUovEj5BmNs2Yf0Ve8RAlkKPKE2V2pZs/QY904cEBjyjTlV1J0W
	 ETrvoryJpNi0GRL5jnjwsAwtQZga0m0BRszqa3yLo0yjYun4oD3axrKZ4O8eVbLx5d
	 WHABfP7ahaGTatWHcyCxsSO0=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a01b112fa2so45869895e9.1
        for <regressions@lists.linux.dev>; Tue, 06 Oct 2026 11:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791309745; x=1791914545;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7VPKoVET0WZyi57RaxQihc41cTq7wyN7m0LKNzGgdxA=;
        b=aeIJYDOz94VZuKBOFBHsrW3DrbcrlGg0UUN/o+GT9k5Oq7of9F50je3qjaJwmTHbir
         lMqAPpl8Ck8gQ4MDFtV2Awjw0HvryfpMbDO0krECa6EVlDW3SpruEeVmbCZs3q7+STsf
         8ViKtC1QZIOku7/ec1Yo7TerurTLVQkYvPlBxQyZTLg8fBuaIj1vT3g7FmRaZjGeb3mG
         ygjM2NUy0Qvhw5wPJygN+s0h4fM5jiTmu/IE1AIGhdq9qAE9dSRGal68FwzPCLH3p46B
         E5XP8Ndae40VYsXWt8NopSbq04c1rr4QVslq8yFxVZ91KaIQXd4M9HUltRxXYB3XLDu+
         Ap4w==
X-Forwarded-Encrypted: i=1; AKwUvBxbD5ZN6dAp7WY5QBBBB+h+Q7tjxBJ/6hfv0FxmTzICnTBcVSy2K7mRydDCcePmiFAGjPMdkW2Xv9PZxg==@lists.linux.dev
X-Gm-Message-State: AFuF++meVEBEMKbB6MUksh1BlprmtKRiZ1JqlEQqTuziocdmgSvEa4/u
	IysSs9tRXbO8fOBggqhVVS5LognfKifKPoOimEJV7I4vSYWRqXODe4CotE1RKGcNHWFDFKTMwOe
	R+mDRZkPMwMepN8fzBCiG3/GL6j38WbxG6lToSLLdkxUAP6f4R7Zsu1NMj/aCorxNvcsG028GjZ
	7cnALa
X-Gm-Gg: AYBFou0wZMiPHtWvIcqTqiQIexjq9a/2qA8Nze2T/bJJyBsBAmIHTkU8K6YA/Efrgdm
	ABR47JOTIFChlvY1ofr9i9mosVmZrNyLSqjmxQECc5qFSY0OG1eKL3OyIRBXupmbk5cURRxzzeu
	c+08QsTeWQVg37+OB8YveSGE6tosPVu+gGUeDtcujAwLOpqvdwkY3UJHJY0L4AaduJDe+rTXsFL
	rEOarDgmPnQ9RG3RooBJTMiTo2Y6/dvCKMRcdJme7auNMHudBwZ70WXTvhhAz3aLCUcK6+2LLwb
	pobCj9+KlrlfbIB/yYyy5Q99PIdItsUV0tBAENyVNRY8KwHTLHu3VhiYZmWVGqgGOxDKldj0SiL
	cwTwmXN8=
X-Received: by 2002:a05:600c:1c16:b0:4a1:7832:dfd6 with SMTP id 5b1f17b1804b1-4a17b5340c8mr40388875e9.5.1791309745299;
        Tue, 06 Oct 2026 11:02:25 -0700 (PDT)
X-Received: by 2002:a05:600c:1c16:b0:4a1:7832:dfd6 with SMTP id 5b1f17b1804b1-4a17b5340c8mr40388535e9.5.1791309744934;
        Tue, 06 Oct 2026 11:02:24 -0700 (PDT)
Received: from px13 ([2a06:5902:822:4600:6f35:9ac4:c6c9:f701])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm5540315e9.2.2026.10.06.11.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 11:02:24 -0700 (PDT)
Date: Tue, 6 Oct 2026 19:02:22 +0100
From: Chris Bainbridge <chris.bainbridge@canonical.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Jason Miu <jasonmiu@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Alexander Graf <graf@amazon.com>, Ran Xiaokai <ran.xiaokai@zte.com.cn>, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org, kexec@lists.infradead.org, 
	linux-mm@kvack.org
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
Message-ID: <asU2AD6DxGSD0ek4@px13>
References: <asE0R_f2r2TL-3Sy@px13>
 <asTTo3AFzQoqZLoP@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asTTo3AFzQoqZLoP@kernel.org>

On Tue, Oct 06, 2026 at 12:55:31PM +0200, Mike Rapoport wrote:
> On Sat, Oct 03, 2026 at 06:02:27PM +0100, Chris Bainbridge wrote:
> > Hello,
> > 
> > I am reporting a regression in KHO handover.
> > 
> > In the most recent Ubuntu 26.10 beta mini-ISO releases (2026-09-18 onwards),
> > the first kernel reserves RAM for the downloaded ISO with a memmap directive
> > such as memmap=<size>!4G, then kexecs a second kernel. On affected kernels, the
> > first kernel reaches "kexec_core: Starting new kernel", but the second kernel
> > produces no further output and QEMU spins at 100% CPU. On unaffected kernels,
> > the second kernel starts and finds /dev/pmem0 with the expected "Persistent
> > Memory (legacy)" range in /proc/iomem.
> 
> TO make sure I understand this correctly, you enable KHO in the builds of
> the installer kernel and then the installer command line explicitly enables
> KHO.

Yes.

> Is there anything you actually preserve with KHO when kexec'ing the second
> kernel?

No. kho=off is a valid workaround for the mini ISO. I only reported it
as a regression here because this was working until the bisected commit
was merged. If this is intended behaviour then it is not a problem.
