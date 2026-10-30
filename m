Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377603;
	b=aI4mXHr3TvMVlTRlCZIazcbDX29bwxyKpxaRHMlwdP72imV+nR2GVAMlSltEBWJ3h9vf
	 f/56E+eOcT6InclYz1YOCMvR7chyvHdjvqwjXasKRh/cB/juc4EEOxKJ3HX/5i+uryDT8
	 ILvjmcStxXAE+Mho4nqdb8OuVH7KR5SPbPSLfRW7MB2jKnTgRKluUC7i9FouW4MIpUQvR
	 yJceV+cXwvZ+eGkojdLDNo2HLeHsbbAJ329aWpMSQnppEvtybydoPbLC6zb9wp34127Ls
	 m9ZgUd42WS8fVLB6Gm8ypC2odkX39wxWlsuAyd6Xf2FdjYFA+5SiVPAjoc1XQCF5lgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377603;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:X-ME-Received:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=vewquYtyWMTTPew/3rciXZBlW6QyJvk7tE2jn/GyFDA=;
	b=2xCgOOQOO9Y4wcIlWrDW0Dl7pknjKuc1ZaOLSHQPxNepRTfcgCYuGpaU6deLh5O3wudh
	 tdCz6yUum5EYUG0BvMKqFs7mDH+vM+OUmm/YojYRCIoywOcfg9nNUv6ymGLiPfQdW6+Bm
	 qIg50fBn/8XEjNluubntIXhqNbAUSioSWkz28ZuSb75b7PsjEggAnf5fkL8aHXCMTJC3t
	 Wrb84JnrRHYF3RolBmBvsGaPjJUV/J1nqdNnaVvRQcEigPpQi5BQMS8+tlYJVHiG4aFiY
	 y0T5WwWgRpRIX+BpJgiF4sp3Bx18pKQInCDgArhLQql89eXqPtS4iRzUDHJng8ZMmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XRRyQGq/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD441606A31D
	for <regressions@lists.linux.dev>; Fri, 30 Oct 2026 16:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XRRyQGq/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91851F00A02;
	Fri, 30 Oct 2026 16:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377602;
	bh=vewquYtyWMTTPew/3rciXZBlW6QyJvk7tE2jn/GyFDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XRRyQGq/3uX+IPDR3SK024hDqphSBS30P0FW0sJZLwHGnA2+Au/3EphLELAKkNCyB
	 vMoadFt5l+1hEa2MhxDa4B1WNlkJEL8fePVMvyrHIA99alHJIY5Ga0lAoIUaUUz4+b
	 HxjTC6DO/GKHJS3vXPC934doaX6Au7OvBQQZ4vk0gJ0RZTL+nC8Ehn7+GshLVkKJDe
	 8taoix+UEcGcQASoL+fM/8+WrhTuW0y4PSLVaIZi5knozggxn28scdDLIwsGLc0oKm
	 VCe2k04wQqAEOjdECPL9fhLK+Ebu4w3W3Jq44LpMlrwM+r8q2vfqvpNhMjbtbIOcZE
	 JzE5bMmFntX/Q==
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.ams.internal (Postfix) with ESMTP id 0B6BE198003A;
	Fri, 30 Oct 2026 12:26:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Fri, 30 Oct 2026 12:26:40 -0400
X-ME-Sender: <xms:PcXkarepDZcwkXPaDvw1l9meX1ix8cBNcbSba9-rds1sl6XeloMfDQ>
    <xme:PcXkaiYAI_vT59BqHq0ZygNMM5okQJjYKU_DN9AduU74co3ByTkWXIHszmuEWklPW
    pgBXsdumm_lvCkL06kjKhQ-_xXGCB8jRqzrMoP2wm0GjyteJBdcuMs->
X-ME-Received: <xmr:PcXkak8ezFsZAfxW4l0Mvcm4LtO1fFfXqEJiulOIBKEWLfmrRvW-8zTaQBY>
X-ME-Proxy-Cause: dmFkZTGEAIFWzBJh0zWLN17+nisZqat9HnPlshouus3rVlwm90kalixREFWaFGYcU/tF0W
    3UdkUB5dz3jJ/7gphqEuNFHpf+z8VsmOxTezlK75l5ORKrVKFBa2NEgRwbYKxcTq7uyZQA
    W2W98B6jmDIrAQO8QKfXxueVgpiWnggcI/BJ/18E5DEgyYQ/qfuiqqVvOgCo9BjplJFuNF
    Cq2lBkk/rOOp1wPHM5RPg+KN1AdKgUA5k0+FVNS57TFgOuKqthusIzIHYb5h9oR56n2lPD
    m3bIIIT/Oa4M4xQorz7MW066A5A3Ilw7G7kLTJS6cCINZEIS17roHp+ddyILdojq+VTTHE
    2MY3XR+A2l7OBM2ub01U6gbuYDHwIWf+Swtm5zC7sOi3harXi4z0yCXZWSoHi3RAKslPon
    otpxzqyqAYRWWojiWcoT7qUs6tH5gim5jFMxHgdLDNVKCh5KbnwHxj24tVQmrM/pPr+8RU
    Lse0RbqcqIjr9tKNAVnOGXNH8X5IFxsk3dnHXP064AXskGHK77xRqxNkH/D/NDqgQHTFjU
    4Cn1v8+ReLH7NyMTA+RnhfJZnIw+IahQV8Cs5go/vouHMcd46srIpH0UsKCBuYR6U+VhFT
    5X4IrG3Jg78xgttGn+AtH7t6hdR4nEakdA4xO0VeCYxleQm716CLywLEHQrQ
X-ME-Proxy: <xmx:PcXkamVlQ2jGwIgyyw7CUrFTE9b22yNeHLvUZX0SYWvWKneZMieQJA>
    <xmx:PcXkatdRTC1wqqXKq8XEshFHyfBdgKMD7rGUhJu0dEwBET2-mSU3FQ>
    <xmx:PcXkarXiQS1P0vfF0vaQ6CaF_zxTEGGxOu_yo6_3rmhGSuJ5WdPWJQ>
    <xmx:PcXkakWDbmZZj9fKf7Gmq_vbad2xvqM_FADgEPUBMqoLcDaV9qZ0Cw>
    <xmx:PcXkarMhj1T7gDsxJAxPahlNVUaY2kwoc8YFK8_raX-_IUOofkJZ5i26>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 12:26:36 -0400 (EDT)
Date: Fri, 30 Oct 2026 16:26:35 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Challvy Tee <challvy.tee@gmail.com>, x86@kernel.org, 
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	regressions@lists.linux.dev, stable@vger.kernel.org, dave.hansen@linux.intel.com, 
	rick.p.edgecombe@intel.com, vishal.l.verma@intel.com, kai.huang@intel.com, seanjc@google.com
Subject: Re: [PATCH v3] x86/virt/tdx: Skip TDH.SYS.DISABLE if the TDX module
 is not initialized
Message-ID: <auTExTAMoaKKjBrb@thinkstation>
References: <auM3KKutfutAqgWG@thinkstation>
 <20261030154851.907726-1-challvy.tee@gmail.com>
 <939b4cc7-5c7f-429d-a9be-830aa1c53ac5@intel.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <939b4cc7-5c7f-429d-a9be-830aa1c53ac5@intel.com>

On Fri, Oct 30, 2026 at 09:13:12AM -0700, Dave Hansen wrote:
> On 10/30/26 08:48, Challvy Tee wrote:
> > --- a/arch/x86/virt/vmx/tdx/tdx.c
> > +++ b/arch/x86/virt/vmx/tdx/tdx.c
> > @@ -2321,6 +2321,9 @@ void tdx_sys_disable(void)
> >  	struct tdx_module_args args = {};
> >  	u64 ret;
> >  
> > +	if (!tdx_module_state.initialized)
> > +		return;
> 
> NAK from me on this.
> 
> If SEAMCALL is fatal then we need stronger barriers on the generic paths
> to SEAMCALLs themselves, not one-off patches of the sites.

I don't think the generic path is the right place for it. For every
other caller, reaching a SEAMCALL on a non-TDX system means something
went wrong higher up, and we want to see it. A check there that quietly
returns an error hides that. Making it WARN would catch it, but then the
crash path would still need its own check before the call.

So gate the call on X86_FEATURE_TDX_HOST_PLATFORM, the same way
paddr_is_tdx_private() does.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
