Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D156AA1
	for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 15:59:50 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-313e1c27476so913173f8f.1
        for <regressions@lists.linux.dev>; Sun, 25 Jun 2023 08:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687708789; x=1690300789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gHlFiZs5tFIFJlBDQPU4DvtUwczU5PH/nPUQB8u9ynA=;
        b=NBsJvYr5y6vAfQybS4O4IodHezeegPVCM5raoQdCvB7dcrK1BQAcOQvwjyWUYBrZ17
         AUiE9S01t2WeoDVZkaLSdZFzSJRjl+r0rBQ8USOw0/UQZkBZ8Q0v04F45iJ3vCodobEM
         FrIwejpF5rzxJEUp5trugER+zOLjsQS/ZEDdrgFjPXpdtzcD89oUWXcUwLREyz6aW7hI
         WzqReUcp4OKSVbYN3BDTiPO5lakVCGCq3fcpX/wMIB13tIuoI7q8msYTOc+kgTfAMD7K
         VW68atjGBC2c3mv8ABYPFEnZwVRHkMfTxpINat8f+thxSuH4tv+akpSAfrHcpeEhf7tE
         xAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708789; x=1690300789;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gHlFiZs5tFIFJlBDQPU4DvtUwczU5PH/nPUQB8u9ynA=;
        b=ULfzf1epGVpkz4/9WC9sK5eomLO43cH/t08Lz8uc2ckHZRPtSy7DjI7/LDzhhpIqMM
         3qT+7wghq8ksufQBFxY+7JF3ovwyH3TPgK9O7A43bGvKa1NeKNLnXXNeB6ENZ27NPpPz
         l9rd22dOlCJDjcQB5aguLxKjwc7HgUC0vNKxwnfFycK4V2V3HQeSj7qowIs2KhdCIRHc
         xERcEjc3fg/oedQp5SNBvi6owdDW+vP9iGD2h3y9QGkqMPFsB57nSZis5joldauldAvv
         PodKL2SYsTBTvJx4ypbBBbMOCt97O9RhnTuD2lQVeTwnWRzZBBG4K0W3giK5/mmqs4aw
         jMsA==
X-Gm-Message-State: AC+VfDwvpLkdUBH4mvYavim8m4C4kIoh7o815LyZnmKb6AbxC8mptX/U
	LJmsGnZKahN3ZusFLlyL7Yc=
X-Google-Smtp-Source: ACHHUZ5ATvmUoOCSXJ8ImWBo56+GVeVF8ADqex2ejrdSs3fcxjADfw315UCi5HrmFvgrUkSMwjbVuw==
X-Received: by 2002:a5d:6dce:0:b0:30a:e63b:950 with SMTP id d14-20020a5d6dce000000b0030ae63b0950mr29180323wrz.31.1687708788471;
        Sun, 25 Jun 2023 08:59:48 -0700 (PDT)
Received: from localhost ([2a00:23c5:dc8c:8701:1663:9a35:5a7b:1d76])
        by smtp.gmail.com with ESMTPSA id i13-20020a5d522d000000b003119633ecb5sm4891836wra.88.2023.06.25.08.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 08:59:47 -0700 (PDT)
Date: Sun, 25 Jun 2023 16:59:46 +0100
From: Lorenzo Stoakes <lstoakes@gmail.com>
To: Forza <forza@tnonline.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, Baoquan He <bhe@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, a1bert@atlas.cz,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH] mm/vmalloc: do not output a spurious warning when huge
 vmalloc() fails
Message-ID: <e3ce1745-0a3e-4c9d-955e-2a0ce20422cf@lucifer.local>
References: <20230605201107.83298-1-lstoakes@gmail.com>
 <cd47d6ac-69ce-0315-dd45-2cb9dce57f36@suse.cz>
 <f6b42d95-09f1-48d6-8274-e6145febb31d@lucifer.local>
 <2a6fa9d6-53b8-93cd-16c8-309ce2b8e3ac@suse.cz>
 <20230607093316.cdf60df195915fa9d38067ea@linux-foundation.org>
 <11b893e.86425ef4.188f33688b8@tnonline.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11b893e.86425ef4.188f33688b8@tnonline.net>

On Sun, Jun 25, 2023 at 05:40:17PM +0200, Forza wrote:
>
>
> ---- From: Andrew Morton <akpm@linux-foundation.org> -- Sent: 2023-06-07 - 18:33 ----
>
> > On Wed, 7 Jun 2023 10:58:40 +0200 Vlastimil Babka <vbabka@suse.cz> wrote:
> >
> >> I would really suggest moving the fix to
> >> mm-hotfixes instead of mm-unstable, and
> >>
> >> Fixes: 80b1d8fdfad1 ("mm: vmalloc: correct use of __GFP_NOWARN mask in __vmalloc_area_node()")
> >> Cc: <stable@vger.kernel.org>
> >
> > I've made those changes.
>
> Did the chabge go into 6.3 stable? I saw these issues with kernels 6.3.0-6 3.7. I now updated to 6.3.9 and have had no more warnings since.

Yeah, got the notification from Greg's script that it landed in 6.3 stable.

>
