Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00113C73C1
	for <regressions@lists.linux.dev>; Fri,  4 Sep 2026 05:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500590; cv=none; b=NvQkn8BNYmdygWhzsDtUSeRYoiOmbgj0Ffv4s6QR3MTfvUVoRS8ys10d2WtDS8QYKcP4zF6q8wZY2yGfE/ECDSibvjFYr+DjKE9CJvtNPoKma5/OUuWsdAfEyadT4bxLiuNBvkKExGWrxCRydu4c0s8vKkBL7Xv6M8hoaAKk54Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500590; c=relaxed/simple;
	bh=WKOAdQYFmbJHqAPATl7qzYWXuN0szCi6+F+swb/3dYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVxXeYRTEoEsqv1TeH55aX3b2vXl1RUbuRaobw3IYnD7N6CawLw+bWQYccMvDCJzD2h0SgLM0euJWGoAKgK1GfSWiidmEtpXXzmkRpVnMZPYBvTBUhWh7cZdwRWb7v79jZbsXDIckMkrrjjo6ETCkujvTeH9hquv0/8B1Lem/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGXrZvPM; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGXrZvPM"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so699876a91.0
        for <regressions@lists.linux.dev>; Thu, 03 Sep 2026 22:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788500588; x=1789105388; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fyaQ4vR8zK9HgI6ETSL4jxpRT+46yI+OILInPbjhckM=;
        b=LGXrZvPMULgNcFTt/wH5nMaxnGxVhgoQe+5SzU5mL8VE4r4JSD7uENRorzdwmYKgI0
         d1p2iFE3z/bASsuoVIPYkIDkuWFFDrWYJ9BYLp2Fw79kJcVcZn82mudRFNg52qPhXKMP
         UsX4+OotVrcsKaBjpjLwwMe0/ycOFMRsGicAS5gxiJIfWboho49xAkHh85L1zhoGsYst
         Tmxn0GOTmS7MuHIAy4PuHCnfaFJjgF48DeFX7L+Mk74lGiIKLKsFzY4s+OqpPRIMevOh
         6Pjfej793UuBvGFeUecx5CERfg4nVqVr8Cu22fs1airDB6uzH3rfK31w1fumE7sGmVaw
         AK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788500588; x=1789105388;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fyaQ4vR8zK9HgI6ETSL4jxpRT+46yI+OILInPbjhckM=;
        b=ESuqENL/B+1HuFLx9enBCgBLVRHMqdvEMD0EznQM5pVAA3ZW17jFb/uEYiJjtve/Ta
         gpp7/mAIuJDQJ2jzegVxIIE1zWyVvQ7EJKw2fpSyyNfakHIrNaLvAXI90Rrmg/AX9h7r
         TaSPf3gjfNwCzO4x7ga3ynLYd8QCgfVXeBuswAFpWZsLrZghOfWQjE7RhuQMnVLNrJN1
         Ye/wMHTKMJQohzzT+a/aB3Itt/heoevymeqjatAtjXFRThKu82Z0pMSdIR0Ad2SbigOX
         9q12N2KcwqrNVE6nrUy/gKAQ+PSanY5xCeinYb4PcutTqC5mrngGKPpdz8uVre6TXo/c
         i61Q==
X-Forwarded-Encrypted: i=1; AKwUvBwbsYQwwrPHX8OzuGCboi/NHZsC3uP4xupwzNFOdclgMISZyA1KX1ufYyPUhhR81gNF7X8kBlCJ9KiFiw==@lists.linux.dev
X-Gm-Message-State: AFuF++kWly/no/SYro1gGgUn6cYVm2v9mNDhgYYLSJsPAI2be1lJYOsr
	UZFP7k3RJ3bRXtYpbUIc6fraMzqxuWRzfobiiZALzLCLYixm93udxDYx
X-Gm-Gg: AYBFou1aExwbNXIbq1NuZNzfaxiYY57fwRVqJIEG3XPluP3MrlCkubg9vnLLHbRBeCO
	AMQrmL7AbaaC2R4nlHD7usjM2o3QsbufMUJQQze9SPXnnnbg7qWxFjQyvF+hcuQbyPkx1IsS0M2
	YfDLpkhB+v/C3iCicSjAmkpJ301+V3qUsUjfSBvHgBattaqz7xnzvWqcgRMyKCEVNiz9qOr2QGl
	zxNidXL/9/PF3h2LQQTPJ4d14U/LlqjWnhLie9cNriRz93i2x9TiIUUEII/LxiS/R9HvATJO2Kq
	lyFupIh2YzdSLXvH1dJD3MACdVsyGJVM7pk+qZNP7i6xN6lcqeLThTnJV+EGdxXlHsVn+wX6NgQ
	ICLF//K7aJf25JvlnLJyZrTgYM3UrAOEMzHRS5RIRWWcN27TXBkKzoWEKhwWUO7+r/yG7wNcVzc
	6Kh7a9zDlGwAChCXnVEdaQ1glJWcOri20R7Mc0Cc/4M8ZItf93gCDq/4xR7AgW7kKYS8zVQK9d+
	ZrkHnq9u010RJjRuhpqRAg1NhbTqYftVRYG
X-Received: by 2002:a17:90b:4a49:b0:392:ca3b:370a with SMTP id 98e67ed59e1d1-39b26100cd2mr5232253a91.2.1788500588005;
        Thu, 03 Sep 2026 22:43:08 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([122.161.52.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2615039asm2556683a91.15.2026.09.03.22.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:43:07 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:13:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] Power9 pseries boot hang in v7.2-rc6, narrowed to
 PowerPC GENERIC_ENTRY conversion window
Message-ID: <appZ1UB1tzKz3IY9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com>
 <e27eeaf4-c2c9-4ef7-9e1c-0a5fb45755d0@linux.ibm.com>
 <6d1b5f38-f4e4-46ca-88b4-7c18dd6c6280@linux.ibm.com>
 <anq72IebDSu-wWbb@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <ansZjSJMWMV8DDF-@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <2f7e6c34-7258-4b20-a38e-cedebccb835f@linux.ibm.com>
 <985770a7-e488-456a-a9fa-aa71f1cbafd5@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <985770a7-e488-456a-a9fa-aa71f1cbafd5@leemhuis.info>

On Thu, Sep 03, 2026 at 01:22:35PM +0200, Thorsten Leemhuis wrote:
> On 8/12/26 07:16, Venkat Rao Bagalkote wrote:
> > On 11/08/26 6:16 pm, Mukesh Kumar Chaurasiya wrote:
> >> On Tue, Aug 11, 2026 at 11:37:45AM +0530, Mukesh Kumar Chaurasiya wrote:
> >>> On Mon, Aug 10, 2026 at 05:19:27PM +0530, Venkat Rao Bagalkote wrote:
> >>>> On 04/08/26 8:23 pm, Shrikanth Hegde wrote:
> >>>>> On 8/4/26 2:04 PM, Venkat Rao Bagalkote wrote:
> >>>>>>
> >>>>>> I'm seeing a boot regression on a Power9 pseries LPAR. The system
> >>>>>> hangs very early during boot after:
> >>>>>>
> >>>>>> Quiescing Open Firmware ...
> >>>>>> Booting Linux via __start() ...
> >>>>>>
> >>>>> That is strange. not sure where to look at without any logs.
> >>>>> Is it a specific config that fails or this specific LPAR that fails?
> >>>>>
> >>> Is this a specific lpar or all power9 pseries are exhibiting same
> >>> behaviour?
> > Its specific to a lpar.
> >>
> >> Can you try the below fix?
> > [...]
> >
> > I tired this fix, but issue still persists.
> This regression made it to my list of tracked regression -- and it looks
> like this stalled. Is that the case? Or was this resolved meanwhile?
> 
> Ciao, Thorsten

Hey Thorsten,
I am working on this, as of now I have a theory that the RMA size
boundry is being crossed by something and causing this thing.

For now the workaround is disabling KASAN. Can you also confirm the
same.
Can I also know the compiler version you are using?

Regards,
Mukesh
