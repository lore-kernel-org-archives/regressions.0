Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33AB1F92E
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 10:28:42 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-4f4b0a0b557so2255275e87.1
        for <regressions@lists.linux.dev>; Tue, 23 May 2023 03:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684837721; x=1687429721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eWUyqe1Hx0qJvTJ8mr6ssQT6TVvbWeNPeCd8kj4GkHM=;
        b=hOve3PIgESzmA1/VwP9qwbqQQJq41+7E4NS4NExcIxi7kGA9xY3KUSYUgZ6E2CR6eu
         teZIz2BZSliKnG9iC/5e0txWLNlb5yHuQnuIX2GotfaWc8z1S1Cg08mETbuGrWqoTNlh
         jHw4vTN0K3+s+UbHSaa+o5d2EVBvI4YssvxDkYVk5/3gB/tRGJNfi1/S2VtF0tQDKV1D
         q/s/OeGc8Tfr0XUc701qADiqbWwX9QX0RsryuvcjBY4d6iLh+DKD0RBZALAsoFKZk2/s
         3duS0k4z3T4Z2W2RBHRM7kEfryP6nJLWdN77HgkrIRDel9hXu5CFr8T3k6nA+D38ken9
         BAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684837721; x=1687429721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWUyqe1Hx0qJvTJ8mr6ssQT6TVvbWeNPeCd8kj4GkHM=;
        b=iTSB4IYKwNnoTch9zWbzPmKYtKRfCB9ABoWW0to4bNBIbgRnF98wB1iiJqlBdbOSG9
         tpUvmyHbPFr/Yix5/kARBw87hcS1pOjaPAdLPpIAI9mQPRxMBVM2tMyVx1ugFOGPB1o9
         XqV1qw64mP0OfHoZnBq8jyIHGnM6yv5fEnucfAKlt6nxupsrs1Od8tUsrXqikrj/VIIi
         jpGfObbCpit+cK/EC06Y1xmiSzp6HqYgS5XylCBb4DtIiCAhSUE3G+FFEEPebOvFIlxq
         kvOZa2eBVQhVtOJ9EMpOjY0FaaYlQVwfJ5Y/4einq4IQXhEZGSaQxb1jH5fdQfz64K5g
         JTQw==
X-Gm-Message-State: AC+VfDz8+WEqK8tf6ShHxymRSiRdQaXLHk5NGxcEC0x2ENEEZdHcgKMl
	AsdN8J/xyOV+UZvdyrmD3GU=
X-Google-Smtp-Source: ACHHUZ7FKsiuoxhPaIQ8Yvpa5bGSvahqza7ModaNmEwxSScEs404CydwamQ+ox/0Y2qLDp7NTdU9PA==
X-Received: by 2002:ac2:555e:0:b0:4f3:880b:285a with SMTP id l30-20020ac2555e000000b004f3880b285amr4572686lfk.29.1684837720546;
        Tue, 23 May 2023 03:28:40 -0700 (PDT)
Received: from pc636 (host-90-235-19-70.mobileonline.telia.com. [90.235.19.70])
        by smtp.gmail.com with ESMTPSA id t15-20020ac243af000000b004f121c8beddsm1297639lfl.124.2023.05.23.03.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 03:28:40 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 23 May 2023 12:28:37 +0200
To: Bagas Sanjaya <bagasdotme@gmail.com>, Forza <forza@tnonline.net>
Cc: Forza <forza@tnonline.net>, Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>, Chris Mason <clm@fb.com>,
	Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>,
	a1bert@atlas.cz, urezki@gmail.com
Subject: Re: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
Message-ID: <ZGyVVQxnw6Tn7Xb8@pc636>
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
 <fcf1d04.faed4a1a.18844d8e78f@tnonline.net>
 <ZGwcVTpQNBoJHBB+@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGwcVTpQNBoJHBB+@debian.me>

On Tue, May 23, 2023 at 08:52:21AM +0700, Bagas Sanjaya wrote:
> On Mon, May 22, 2023 at 09:04:05PM +0200, Forza wrote:
> > I have a similar experience with kernel 6.3 where vmalloc fails in a similar way. I was able to reproduce it in a QEMU VM as well as on my system. 
> > 
> > https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc0b78@tnonline.net/T/
> 
> Thanks for your similar report. Telling regzbot about it:
> 
> #regzbot link: https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc0b78@tnonline.net/
> 
It is good that you can reproduce it. Could you please test below patch?

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

Thanks!

--
Uladzislau Rezki
