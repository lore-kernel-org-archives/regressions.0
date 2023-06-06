Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949E5660
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 08:17:07 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-51480d3e161so8385582a12.3
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 01:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686039425; x=1688631425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lHNjN6gdZhaDtvOlF+R9QTxsWy2eKEXasQ4TauLL/WQ=;
        b=AA1c/cIjOdVxZRb8bD6FV00DOkrXIJMht6993QQ6O8BDLNFzeuRTt+gZbkNet5esOM
         oQbKvdrx1YPI1OZRBftEzGRWkPaJ2cmvA0F6MpCAmv6WIT4OutHINVnu71pn4oiYtmOd
         MTE/FQO/pclaJYFHepSoZPy7lHZ5rAJss8Nk54s5ZexZU5yLBjdW4+7q2JpIwQRJACOS
         gm2MJ8e9Ro+YUwwm3fRdMeQLzCrJ2F/wib0jjD8zO/TeI00NwnSk1PcF3DSE6DAltI3P
         7fa6D2Ed/Z5hw3UxyIqauwfRYEqfnQu+8r/21fekrvmSod7cabIrpBJjM/pvUA187NOd
         KZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686039425; x=1688631425;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHNjN6gdZhaDtvOlF+R9QTxsWy2eKEXasQ4TauLL/WQ=;
        b=k8+pDiUDAcW2zRseLsZDWIj3HM6N/pRAH5Jv4V6//eGUs0hwj/I5RGHsJPaqhaGOmU
         IZSPp+2E1MHTXHOKdK4/Ieso1qJGx1j1nQBv3x79Guzg8l0ck4pvZdv2m0uw4DzOGFA5
         IQ4X+LyxtnMSsDFWT2JKBMQwNhH7uUPHV1t9+ppVoVo8YB4gmZCHpjj+b76uAuOhKs3X
         4MH8OrvTNOylpd1rS83Z//cTvX4ZXidxzu5dh247U20rde6vlrIv5Zf43BBbXtrwgp9X
         zdU3iWqf37Bfy+cmPAVXbzUDI5bHVACK5aPs1mrD+OFs12LyQnsXMzO7MX17K82Nhiwg
         tkjQ==
X-Gm-Message-State: AC+VfDyE15yQGsTDmzF7ayg114hbHsZf0xbUBcX2X4erefMGzt0K0jYv
	5vaHVAILivL+kNovHC9FsLo=
X-Google-Smtp-Source: ACHHUZ5eL3mm4hmVVfaiwbIw32h87AHqgPOFp3AOp6F3ehkMMkLPIVf2iZyojfUclmyEFPMd/ebSKg==
X-Received: by 2002:a17:907:7248:b0:977:4b64:f5e8 with SMTP id ds8-20020a170907724800b009774b64f5e8mr2081348ejc.57.1686039425038;
        Tue, 06 Jun 2023 01:17:05 -0700 (PDT)
Received: from pc638.lan ([155.137.26.201])
        by smtp.gmail.com with ESMTPSA id lz11-20020a170906fb0b00b00977da9d4ef9sm2269072ejb.18.2023.06.06.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 01:17:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc638.lan>
Date: Tue, 6 Jun 2023 10:17:02 +0200
To: Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>,
	Michal Hocko <mhocko@suse.com>
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, a1bert@atlas.cz,
	Forza <forza@tnonline.net>
Subject: Re: [PATCH] mm/vmalloc: do not output a spurious warning when huge
 vmalloc() fails
Message-ID: <ZH7rfgeKzhmZzjA1@pc638.lan>
References: <20230605201107.83298-1-lstoakes@gmail.com>
 <cd47d6ac-69ce-0315-dd45-2cb9dce57f36@suse.cz>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd47d6ac-69ce-0315-dd45-2cb9dce57f36@suse.cz>

On Tue, Jun 06, 2023 at 09:13:24AM +0200, Vlastimil Babka wrote:
> 
> On 6/5/23 22:11, Lorenzo Stoakes wrote:
> > In __vmalloc_area_node() we always warn_alloc() when an allocation
> > performed by vm_area_alloc_pages() fails unless it was due to a pending
> > fatal signal.
> > 
> > However, huge page allocations instigated either by vmalloc_huge() or
> > __vmalloc_node_range() (or a caller that invokes this like kvmalloc() or
> > kvmalloc_node()) always falls back to order-0 allocations if the huge page
> > allocation fails.
> > 
> > This renders the warning useless and noisy, especially as all callers
> > appear to be aware that this may fallback. This has already resulted in at
> > least one bug report from a user who was confused by this (see link).
> > 
> > Therefore, simply update the code to only output this warning for order-0
> > pages when no fatal signal is pending.
> > 
> > Link: https://bugzilla.suse.com/show_bug.cgi?id=1211410
> > Signed-off-by: Lorenzo Stoakes <lstoakes@gmail.com>
> 
> I think there are more reports of same thing from the btrfs context, that
> appear to be a 6.3 regression
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=217466
> Link: https://lore.kernel.org/all/efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com/
> 
I had a look at that report. The btrfs complains due to the
fact that a high-order page(1 << 9) can not be obtained. In the
vmalloc code we do not fall to 0-order allocator if there is
a request of getting a high-order.

I provided a patch to fallback if a high-order. A reproducer, after
applying the patch, started to get oppses in another places.

IMO, we should fallback even for high-order requests. Because it is
highly likely it can not be accomplished.

Any thoughts?

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 31ff782d368b..7a06452f7807 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -2957,14 +2957,18 @@ vm_area_alloc_pages(gfp_t gfp, int nid,
                        page = alloc_pages(alloc_gfp, order);
                else
                        page = alloc_pages_node(nid, alloc_gfp, order);
+
                if (unlikely(!page)) {
-                       if (!nofail)
-                               break;
+                       if (nofail)
+                               alloc_gfp |= __GFP_NOFAIL;

-                       /* fall back to the zero order allocations */
-                       alloc_gfp |= __GFP_NOFAIL;
-                       order = 0;
-                       continue;
+                       /* Fall back to the zero order allocations. */
+                       if (order || nofail) {
+                               order = 0;
+                               continue;
+                       }
+
+                       break;
                }

                /*
<snip>



--
Uladzislau Rezki
