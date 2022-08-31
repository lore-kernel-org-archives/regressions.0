Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F881A
	for <regressions@lists.linux.dev>; Wed, 31 Aug 2022 16:46:32 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id b44so19144496edf.9
        for <regressions@lists.linux.dev>; Wed, 31 Aug 2022 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=c2TX4X9uyLpPzlBA8SkX7a5tu94KGH4Yf0CSb9a5La0=;
        b=gzn7AV6FF8ujOWh5fibOQxp7+QWz/iVO85IAc9S1w2Fyk1mCJS4enw4JqKzLOSs+UZ
         eWCx4pEMlFzayH4gm9OTAvX/QrFRL82yJU/pwgkhb3ZH9lOW3S8lNN/eqA66J3AXbLgb
         0HHQSO0x9uYB+FObn7BeiQQQUDiWW866y5StE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=c2TX4X9uyLpPzlBA8SkX7a5tu94KGH4Yf0CSb9a5La0=;
        b=DFRPmBg5c5V1TGEmbYHu9Pp89N/11Ubgt/1dyZnC4ojegguuUH9Q3aEV+KGxK7QG6W
         4oksbiWS6oEwnTBQxD5b4JjMmeKj0U42s0kmnvb9pryNOwKyz63ImrleBAA9gKjp8/m9
         RJEWUQ5PO6WuvYst1uwfWfQifzUIh35fnz8NWbXyBQlCsQ7MpyxRdJCI+lD6h2hNnXQd
         oEJHRkibFIofqczYZTTDrikuwvx5N/6ggmfgfOehxe60wmsYsEqL+xQCB4eQd/ZxEsrA
         c0I+F5u/UYLkt5vG7MnFJtWMyB8ibxwnLTgLEQtr7uYHPh8vfthf11im0UqGUuE4Cen4
         RtTQ==
X-Gm-Message-State: ACgBeo1RfsDapflinU53iiG9YP8Ef/2xlQCJltCYxMVje0aUfDxPLexY
	87QSD0HFfoxh/OgsxArjzmgR9x94925QuN1q
X-Google-Smtp-Source: AA6agR7bbDa5DKgoNrWyfzZ/fdEFBcOm/mlE96B9C9HfTzO8/YsGipLA3cva/q8s3kKyMr0NGIr1ew==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr24644692edb.364.1661964390608;
        Wed, 31 Aug 2022 09:46:30 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id kx17-20020a170907775100b00734a9503bcasm7396679ejc.135.2022.08.31.09.46.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Aug 2022 09:46:28 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id v7-20020a1cac07000000b003a6062a4f81so12020907wme.1
        for <regressions@lists.linux.dev>; Wed, 31 Aug 2022 09:46:28 -0700 (PDT)
X-Received: by 2002:a7b:c399:0:b0:3a5:f3fb:85e0 with SMTP id
 s25-20020a7bc399000000b003a5f3fb85e0mr2629152wmj.38.1661964388324; Wed, 31
 Aug 2022 09:46:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020>
In-Reply-To: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 31 Aug 2022 09:46:12 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgG=mttS-m2OLcnsTwia2roHR2b-DxXXG-tbDH8_cUNiA@mail.gmail.com>
Message-ID: <CAHk-=wgG=mttS-m2OLcnsTwia2roHR2b-DxXXG-tbDH8_cUNiA@mail.gmail.com>
Subject: Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec
 -26.5% regression
To: kernel test robot <oliver.sang@intel.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, lkp@lists.01.org, lkp@intel.com, 
	Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, ying.huang@intel.com, 
	feng.tang@intel.com, zhengjun.xing@linux.intel.com, fengwei.yin@intel.com, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 12:21 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
> hi, pleased be noted that we read this patch and understand it as a fix,
> also what we understand is, since the patch itself adds some memory barrier,
> some regression in block IO area is kind of expected.

Well, yes and no.

It's a memory ordering fix, but the memory ordering part is one that
should *not* have any actual impact on x86, because the addition of
smp_mb__before_atomic() should be a total no-op, and
"smp_load_acquire()" should only imply a compiler scheduling barrier.

IOW, it most definitely shouldn't cause something like this:

 > FYI, we noticed a -26.5% regression of
 >  fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec

because at most it should have caused tiny perturbation of the
instruction scheduling (obviously possibly register allocation, stack
spill differences and and instruction choice).

Except there was a change there that isn't just about memory ordering:

> after more internal review, we still decided to report out to share our finding
> in our tests, and for your information that how this patch could impact
> performance in some cases. please let us know if you have any concern.

Oh, it's absolutely interesting and unexpected.

And I think the cause is obvious: our "set_buffer_uptodate()" *used*
to use the BUFFER_FNS() macro, which does that bit setting
conditionally.

And while that isn't actually correct in an "atomic op" situation, it
*is* fine in the case of set_buffer_uptodate(), since if the buffer
was already uptodate, any other CPU looking at that bit will not be
caring about what *this* CPU did.

IOW, if this CPU sees the bit as having ever been uptodate before,
then any barriers are irrelevant, because they are about the original
setting of 'uptodate', not the new one.

So I think we can just do this:

  --- a/include/linux/buffer_head.h
  +++ b/include/linux/buffer_head.h
  @@ -137,12 +137,14 @@ BUFFER_FNS(Defer_Completion, defer_completion)

   static __always_inline void set_buffer_uptodate(struct buffer_head *bh)
   {
  -     /*
  -      * make it consistent with folio_mark_uptodate
  -      * pairs with smp_load_acquire in buffer_uptodate
  -      */
  -     smp_mb__before_atomic();
  -     set_bit(BH_Uptodate, &bh->b_state);
  +     if (!test_bit(BH_Uptodate, &bh->b_state)) {
  +             /*
  +              * make it consistent with folio_mark_uptodate
  +              * pairs with smp_load_acquire in buffer_uptodate
  +              */
  +             smp_mb__before_atomic();
  +             set_bit(BH_Uptodate, &bh->b_state);
  +     }
   }

   static __always_inline void clear_buffer_uptodate(struct buffer_head *bh)

and re-introduce the original code (maybe extend that comment to talk
about this "only first up-to-date matters".

HOWEVER.

I'd love to hear if you have a clear profile change, and to see
exactly which set_buffer_uptodate() is *so* important. Honestly, I
didn't expect the buffer head functions to even really matter much any
more, with pretty much all IO being about the page cache..

                          Linus
