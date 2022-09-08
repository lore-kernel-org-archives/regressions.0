Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D7E7C
	for <regressions@lists.linux.dev>; Thu,  8 Sep 2022 12:14:39 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id l14so14101469eja.7
        for <regressions@lists.linux.dev>; Thu, 08 Sep 2022 05:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=PL7Z21/Ly2C+Bp4eRSpaZkiqNQbuppt5aGkuojHobXM=;
        b=N9sMda+Nhf3WqJE4vqboHjiASiuKQ9PH/ytFH6O36VQcL7JC4vwawFnkoMrT7TZXb2
         rEtHM11WmHNtUPJlSIkRrqk8NvUThA0754wy0RIYKH1DZGVgksna8qY0ELhpONKuvDZ5
         7YL3UZQSaRsy92iDhuxiT8OWNimVxoIZMk0rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=PL7Z21/Ly2C+Bp4eRSpaZkiqNQbuppt5aGkuojHobXM=;
        b=L632HCI/pK66TA4lwVwTtbQqU0RUbPNrzgUxQIPoC5ABpQYB3OeLoSSoZPehTVLgpa
         4iIpe0axli6vNK1keeR3FE7e/y+ZvRUxFU4X59E6GE5xH4r0pY6soFhSr5vNlxknZLUa
         dGDXbDLgwFNL+6ECPubQMnrjPhBd9lh5lfZbOktmK/XQHV3g2UaP69BUqDT8HKxOeSLo
         Y+czds+uw03A/qJteRjfzvr1XLfQP+YghLmmMeILLFQVBgfrkZIIc+0I7c9UTIbgYE3G
         qHohKLMQ4tHa56H3zNGgv5tbBB4o3/2JXNgxzJguNhRa9/ZjzSX46E5Boyad1qOmibn3
         FTAg==
X-Gm-Message-State: ACgBeo1QLE/cSydWItJN4NE7+eT3HxwwfVwAkTPR93HgZll6xa88pi92
	nmM3aLCv5byP3zsIDdo7845cWsEKQffykbuz
X-Google-Smtp-Source: AA6agR6vpXt+T6oVm6f7SDaGOHEIoQ+/UCWtAa3rRfiZF0JAQ3m6+UK0sH0vwaXQskzBVfnyZDoXkg==
X-Received: by 2002:a17:906:fd8d:b0:73a:7424:6c0d with SMTP id xa13-20020a170906fd8d00b0073a74246c0dmr5887703ejb.425.1662639277692;
        Thu, 08 Sep 2022 05:14:37 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id ke23-20020a17090798f700b007417041fb2bsm1163983ejc.116.2022.09.08.05.14.36
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 05:14:36 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id k17so10718434wmr.2
        for <regressions@lists.linux.dev>; Thu, 08 Sep 2022 05:14:36 -0700 (PDT)
X-Received: by 2002:a05:600c:3556:b0:3a6:220e:6242 with SMTP id
 i22-20020a05600c355600b003a6220e6242mr1953598wmq.145.1662639276233; Thu, 08
 Sep 2022 05:14:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Yw8L7HTZ/dE2/o9C@xsang-OptiPlex-9020> <CAHk-=wgG=mttS-m2OLcnsTwia2roHR2b-DxXXG-tbDH8_cUNiA@mail.gmail.com>
 <0214b84c-71fe-2133-b69d-1e39a19cc468@intel.com>
In-Reply-To: <0214b84c-71fe-2133-b69d-1e39a19cc468@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 8 Sep 2022 08:14:20 -0400
X-Gmail-Original-Message-ID: <CAHk-=wi0FPu6E9sViTxaSmqxM=go+M+DuJpfdCW9f-1adpXUpQ@mail.gmail.com>
Message-ID: <CAHk-=wi0FPu6E9sViTxaSmqxM=go+M+DuJpfdCW9f-1adpXUpQ@mail.gmail.com>
Subject: Re: [LKP] Re: d4252071b9: fxmark.ssd_ext4_no_jnl_DWTL_54_directio.works/sec
 -26.5% regression
To: "Yin, Fengwei" <fengwei.yin@intel.com>
Cc: kernel test robot <oliver.sang@intel.com>, Mikulas Patocka <mpatocka@redhat.com>, lkp@lists.01.org, 
	lkp@intel.com, Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 8, 2022 at 4:56 AM Yin, Fengwei <fengwei.yin@intel.com> wrote:
>
> The test result looks good (only test with 72 process doesn't restore to same level as
> original result).

Thank you. I've committed that fix (with a slight syntax change and a
full commit message).

On an entirely different note, I'll just have to admit to my
ignorance, and didn't know how you prefer your name in the "tested-by"
line. For all I know, you might prefer the family name first, with or
without a comma. But I ended up writing it Westernized as "Fengwei
Yin", which seems to be the most common form in other kernel commit
messages, and in some comments.

Maybe you don't care, or maybe you care deeply. If you do, just let me
know for future reference and I'll try to remember.

(Maybe you don't care deeply, but I remember the mess international
"spelling" of Finnish names used to be when 7-bit US-ASCII was the
norm, so I _try_ to make sure that we at least attempt to get names of
people right in the kernel.)

I only later noticed that you actually signed your email "Yin,
Fengwei", which is what makes me think I screwed up and is the reason
for this note.

              Linus
