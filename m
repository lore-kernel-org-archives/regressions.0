Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711242CA2
	for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 09:19:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id k8so8377818wrh.1
        for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 01:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywmGO6HZoPeDk5pta/Zgi0l/H8NSLfPp6KexyZfvyDg=;
        b=XPRDdbxSOzJuW1tJt8/WHHpRnL8IMglbnT7xSVVogruEXcIywo6nDWDMXJnhsh0Til
         +nQRhwutmq5nZmv8aI9NOzyY7aB/KemObkTtxVM8iPd54uYQwHa5VhbuNEG9JdA0/SrL
         FtFdJhWtJBOqEGSYQiJHuSZPgdwXaf49DGFIzFP7h9d3Ht6cLtqQsnN0EvnpT/jWWLOp
         U53ZDhnVotci6ISnopHFOrEe3RpHuPBKHfX+fFnHH/H4x4eDlURpDi2FoNBvgeFugSCo
         2VU81DsEDzHP38mJ3akPjnbGRTBIKdmpcIKti0fFUr6f6iilXuI6bF572+m+jUp+zKMY
         eMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ywmGO6HZoPeDk5pta/Zgi0l/H8NSLfPp6KexyZfvyDg=;
        b=3APsZTg5KgSbiIYVhH/733+6SFLH872GrL/56PHBMEK+Nwe1RdJYYdYoGxPLo0qtvd
         okka0NX52dcRJ+jPNC3ltvvNT5nFVJ4fpr33oq9ShuDaxbU3gVHwSEggAl/y3uq5N6oR
         RwuthdjEz4CGkI/YNvw6kIx5Jn3fofu89/mPAnUluPjE3F8QGrl16Gyfi0JH2i2JfpvL
         faFYPU5NNNWaL9kGMvWXFuGfoWHEQM5Io4j2rPYsUArPcB//DGc//OMuRR9ZO4ieW4oG
         tHQrqNhGMjb9DIARoGD5WkF9rZugey6nZ/21C0bxE95QA683fQMEwERAOXQUDloKjB3Y
         CWow==
X-Gm-Message-State: ANoB5pki1InZlpm86YlbJDCzrFwcCdobDbxsa50L+Fwa5l5ZeKwRBCQf
	fHpPAUdXdQFFJol2wobEOc3dww==
X-Google-Smtp-Source: AA0mqf4IvIt8ecYfLqqdpfe2Ie8mTRQ05q6WdL2M9MInxr9ONrK62RPNSh4FwljtDFBhkb48MVrNJQ==
X-Received: by 2002:a5d:53cd:0:b0:231:355b:211c with SMTP id a13-20020a5d53cd000000b00231355b211cmr3562614wrw.509.1668763170487;
        Fri, 18 Nov 2022 01:19:30 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:9c:201:4799:a943:410e:976])
        by smtp.gmail.com with ESMTPSA id l8-20020adfa388000000b002417f35767asm3200743wrb.40.2022.11.18.01.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 01:19:29 -0800 (PST)
Date: Fri, 18 Nov 2022 10:19:24 +0100
From: Marco Elver <elver@google.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	kasan-dev <kasan-dev@googlegroups.com>, X86 ML <x86@kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-mm <linux-mm@kvack.org>, regressions@lists.linux.dev,
	lkft-triage@lists.linaro.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Potapenko <glider@google.com>
Subject: Re: WARNING: CPU: 0 PID: 0 at arch/x86/include/asm/kfence.h:46
 kfence_protect
Message-ID: <Y3dOHNh82NQboctR@elver.google.com>
References: <CA+G9fYuFxZTxkeS35VTZMXwQvohu73W3xbZ5NtjebsVvH6hCuA@mail.gmail.com>
 <Y3Y+DQsWa79bNuKj@elver.google.com>
 <4208866d-338f-4781-7ff9-023f016c5b07@intel.com>
 <Y3bCV6VckVUEF7Pq@elver.google.com>
 <41ac24c4-6c95-d946-2679-c1be2cb20536@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41ac24c4-6c95-d946-2679-c1be2cb20536@intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)

On Thu, Nov 17, 2022 at 03:54PM -0800, Dave Hansen wrote:
> On 11/17/22 15:23, Marco Elver wrote:
> > Yes - it's the 'level != PG_LEVEL_4K'.
> 
> That plus the bisect made it pretty easy to find, thanks for the effort!
> 
> Could you double-check that the attached patch fixes it?  It seemed to
> for me.

Yes, that works - thanks!

> The issue was that the new "No changes, easy!" check in the suspect
> commit didn't check the cpa->force_split option.  It didn't split down
> to 4k and then all hell broke loose.
> 
> Oh, and I totally misread the kfence ability to tolerate partial TLB
> flushes.  Sorry for the noise there!

> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 220361ceb997..9b4e2ad957f6 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -1727,7 +1727,8 @@ static int __change_page_attr_set_clr(struct cpa_data *cpa, int primary)
>  	/*
>  	 * No changes, easy!
>  	 */
> -	if (!(pgprot_val(cpa->mask_set) | pgprot_val(cpa->mask_clr)))
> +	if (!(pgprot_val(cpa->mask_set) | pgprot_val(cpa->mask_clr))
> +	    && !cpa->force_split)
>  		return ret;
>  
>  	while (rempages) {

Tested-by: Marco Elver <elver@google.com>
