Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBCBBD0F
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 19:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676575126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vq/8D3nKqtw1WIOPbD3NZdoxax4+1C1opON75SAH+KA=;
	b=SNUZwIzQmt5mz1clN0U830p3oEgWYRLajhY4JFnNshYIiKbq9hB1UhMcTUEZEawpSchYZg
	BOGA10S4v3FAXImHq0NuOA9kOH2KCLhzU1HQY5it8+91hl6KOoYfJUIbmRFfD1kHR9F0hH
	4h95xq//WxZ+f1adcaM1ZHKtykpyplA=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-665-EDWqpQmPONWWT8VX1r16MQ-1; Thu, 16 Feb 2023 14:18:45 -0500
X-MC-Unique: EDWqpQmPONWWT8VX1r16MQ-1
Received: by mail-qt1-f200.google.com with SMTP id c16-20020ac85190000000b003b841d1118aso1768028qtn.17
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 11:18:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676575124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vq/8D3nKqtw1WIOPbD3NZdoxax4+1C1opON75SAH+KA=;
        b=4cvoSNoobm4/ONN0JmZtPHVgC8NdQzYSwkq4d9oHXVjLY39SSttH9At5TTYq1+CHv4
         kzin933Pzupg58WmGvroMOmwPY+V/BIJU40lA5NQcP11gX2VSglQLDpoDifs7BF5IVqp
         cKVjU8qfL+YHVyx57k8jyRG1TJ/1O0bO7BTB+gNIMsnc7zlnaKK4eTmMiLqBAO4PTdVP
         Xi/hTqSbz3IEFmHQaqM0UwyfTS3uju+wQHAk4kPzZfa8X8NzBqngJSjtaERIQSuvjuew
         LEXt3yFWkg9xH3BWRWe3vaou/3HdDo27citY8pQbEgebzkdC/NUx8f16xEW16YU2squ0
         +VKQ==
X-Gm-Message-State: AO0yUKW1a+KAxqy5Ea9jS9hpPiQ9AGBKOaKc++5Wp9U1FPteONXcc9kh
	FF3bGrlBErU00twJHBvt3saYHLRy6MU0pJ2i5/BQfLIGVBhV7lMRTOmKlW2DvOVo0nYW6vkr17S
	1M1PelqZC/8QUN0jds8H5iQi3kNfJgfskVDGjvlFqv504VJBYlo8J+ij3e/G6aNEY9zkRUU+psH
	ZWbw==
X-Received: by 2002:a05:622a:1c1:b0:3b8:4951:57bb with SMTP id t1-20020a05622a01c100b003b8495157bbmr13365197qtw.5.1676575123763;
        Thu, 16 Feb 2023 11:18:43 -0800 (PST)
X-Google-Smtp-Source: AK7set94r9QdJOHGjbfUETh7ovLgpkDfMBET1BqCT/UpQvalJnj5Q431hrj7SLkgGPpOCMlAFoI5Jw==
X-Received: by 2002:a05:622a:1c1:b0:3b8:4951:57bb with SMTP id t1-20020a05622a01c100b003b8495157bbmr13365134qtw.5.1676575123243;
        Thu, 16 Feb 2023 11:18:43 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-56-70-30-145-63.dsl.bell.ca. [70.30.145.63])
        by smtp.gmail.com with ESMTPSA id m9-20020a05622a054900b003a530a32f67sm360565qtx.65.2023.02.16.11.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 11:18:42 -0800 (PST)
Date: Thu, 16 Feb 2023 14:18:41 -0500
From: Peter Xu <peterx@redhat.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Bowler <nbowler@draconx.ca>
Subject: Re: [PATCH] mm/migrate: Fix wrongly apply write bit after mkdirty on
 sparc64
Message-ID: <Y+6BkcrLBKJyGZUn@x1n>
References: <20230216153059.256739-1-peterx@redhat.com>
 <611c1202-1978-8886-eec3-929933ee75cd@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <611c1202-1978-8886-eec3-929933ee75cd@leemhuis.info>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 16, 2023 at 05:59:16PM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 16.02.23 16:30, Peter Xu wrote:
> > Nick Bowler reported another sparc64 breakage after the young/dirty
> > persistent work for page migration (per "Link:" below).  That's after a
> > similar report [2].
> 
> Thx for handling this.
> 
> > [...]
> >
> > Note: this is based on mm-unstable, because the breakage was since 6.1 and
> > we're at a very late stage of 6.2 (-rc8), so I assume for this specific
> > case we should target this at 6.3.
> > 
> > [1] https://lore.kernel.org/all/20221021160603.GA23307@u164.east.ru/
> > [2] https://lore.kernel.org/all/20221212130213.136267-1-david@redhat.com/
> > 
> > Cc: regressions@leemhuis.info
> 
> Not that it matters much, but feel free to use this instead:
> 
> CC: regressions@lists.linux.dev
> 
> Then things don't depend on me (in case I ever get help with my cat
> herding job). And it also make it even more obvious that this patch
> fixes a regression to anyone who handles it downstream.

Sure.

> 
> > Fixes: 2e3468778dbe ("mm: remember young/dirty bit for page migrations")
> 
> That's a commit from 6.1, hence this should likely have:
> 
> Cc: stable@vger.kernel.org # 6.1.y
> 
> [no, a fixes tag alone does not suffice, see docs]

Oops, I just forgot that.  We definitely need to cc:stable.  I'll make sure
it's there if there's a new version, or I hope Andrew could help to attach
otherwise.

Thanks,

-- 
Peter Xu

