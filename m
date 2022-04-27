Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADB82F49
	for <regressions@lists.linux.dev>; Wed, 27 Apr 2022 17:27:44 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id r83so1986168pgr.2
        for <regressions@lists.linux.dev>; Wed, 27 Apr 2022 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BzSUWHcbSbIUG8Be1XSOAdrtfZjDbG3/mXUuT1itZXc=;
        b=VxBKksreuBYZNErBWS4bqoHxx9xPZ+nj7mVZ8RqPksMrWbPjOByZHpFdHzo8eSwE2u
         w0IBM7UDwKQ9irFxTXg3OIdwxCtw43Gya+r26wQEgMOpDgotTePN6z9Ud3zEprsY7wDA
         vHv6/vFQcrhrV7mnbZfG5AJS8yA5w3J3kMVR5fPwdYev2n78fTZhEQipueB5bG5jT2O8
         k/sn58V9WXDgx8fgm+9QncL3AM3wQ7FvHyf8wBlf02BMg9GrA+4hSbCZdiyx4uPXObko
         dAyFfnUtiicAro3PGwNm6nQqZVQXHCskWr9ymzMRZYAtlIl00Zgbi6qaD2ZwdzG3HLDk
         3JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=BzSUWHcbSbIUG8Be1XSOAdrtfZjDbG3/mXUuT1itZXc=;
        b=ShP75PsbLD+z0WNfYtaABJey/kMfiB4+q4FZ5C3fZPAr334uUiq1JUYX9G+ao9uGKK
         3BD5ujSgWNehfXsRvNjHrJLcyaxzo941rjnIowwc5R3AeRdP8mk80cpKwsS9j8Z2MJgS
         JKov/XYn3Qq7ot+ymvcsL/JbQEeJbRBBn1CP/pKyGAEqCAi3fsDuC/525uDhvDSBtcZY
         /topWkON4kKubQ4SAerbhcGxl34tiMFtPhlDKbXLg21fH4g+CBkK8bDesrpOIb8ZIbyI
         mhOcoFjt1ew8qisu3W0J3/l+NQcC1wInyjiGQrei/AalL//wfNDQr0VZRiDAldz9tvqU
         SjCQ==
X-Gm-Message-State: AOAM531xlZsguEMWPkZ38U3RIOyUC6McdarGlzzUnBHITe0Zm7rSDSUI
	Fvj7OfZTGx6OGNvuGImz6bE=
X-Google-Smtp-Source: ABdhPJwAX++wrhvaoohbEVduON8WDdFuUdRNvuGm+VfnK2Nx+3CpW61edOXdfoPxMuKYm/07nEHPPg==
X-Received: by 2002:a05:6a00:1749:b0:50a:8eed:b824 with SMTP id j9-20020a056a00174900b0050a8eedb824mr31049201pfc.50.1651080464269;
        Wed, 27 Apr 2022 10:27:44 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:4f81])
        by smtp.gmail.com with ESMTPSA id h9-20020a17090a054900b001d953eb2412sm3669504pjf.19.2022.04.27.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 10:27:43 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Wed, 27 Apr 2022 07:27:42 -1000
From: Tejun Heo <tj@kernel.org>
To: Minchan Kim <minchan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jirka Hladky <jhladky@redhat.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	regressions@lists.linux.dev,
	Justin Forbes <jforbes@fedoraproject.org>, stable@vger.kernel.org
Subject: Re: [PATCH] kernfs: fix NULL dereferencing in kernfs_remove
Message-ID: <Yml9Djpe5HT0HqoN@slm.duckdns.org>
References: <20220427172152.3505364-1-minchan@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427172152.3505364-1-minchan@kernel.org>

On Wed, Apr 27, 2022 at 10:21:51AM -0700, Minchan Kim wrote:
> kernfs_remove supported NULL kernfs_node param to bail out but revent
                                                                 ^
                                                                 typo
> per-fs lock change introduced regression that dereferencing the
> param without NULL check so kernel goes crash.
> 
> This patch checks the NULL kernfs_node in kernfs_remove and if so,
> just return.
...
> Cc: stable@vger.kernel.org
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215696
> Link: https://lore.kernel.org/lkml/CAE4VaGDZr_4wzRn2___eDYRtmdPaGGJdzu_LCSkJYuY9BEO3cw@mail.gmail.com/
> Fixes: 393c3714081a (kernfs: switch global kernfs_rwsem lock to per-fs lock)
> Reported-by: Jirka Hladky <jhladky@redhat.com>
> Tested-by: Jirka Hladky <jhladky@redhat.com>
> Signed-off-by: Minchan Kim <minchan@kernel.org>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
