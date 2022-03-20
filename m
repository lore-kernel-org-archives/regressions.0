Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC02258A
	for <regressions@lists.linux.dev>; Sun, 20 Mar 2022 19:12:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id u16so17153487wru.4
        for <regressions@lists.linux.dev>; Sun, 20 Mar 2022 12:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SuadMlxSfGkGnsBDB8PuNxLZRp2FTuY3R2jg6AcqHr4=;
        b=cAWsPuY+dAwLlzkkRH6DCeUHwMA4C6NXJNsQ8IeKuaC18Vy/QUUDQLNhjmKkv3LRed
         Ohop4SUuSFLz9Z/g5CRXR5NqfboUJorDD+vd4wCHhJ4SF7wbh9KTM1dy8Pn4aXPyKfuZ
         xRbcIM6lVsVUF+oNAOvTxmQvIZAMMR7VkA3W8rdtgefsrNzaSz7xxxuiM45uaaZ91Kl/
         Gf8Qn8gMHdQpVkPMRAkzblnIRDRFFJjt+X4cI781jnt9j4NQlIUZmQ00B5vJ/dF50+DP
         1s2Ae9RqF1n27KfDzXzWXoDo6zZ2fbp+KV64gkhcrbjKpwe/6QkjeE5EjlCREc8lU1uD
         UcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SuadMlxSfGkGnsBDB8PuNxLZRp2FTuY3R2jg6AcqHr4=;
        b=El8wUX55+TQJXb0CCLCRdFqyOUSInsP4Gkti0NRj4wHnuFMfvBKFcgkEnYQeIxFfK4
         kkW8jJs9Y8i6/6QCHRDw2nmIsgvoDpvvLs4DdkbZb0ts/ZdhvzCet9H2vO+15Ts9/Ahz
         kAGUUCZdhE2gFsvZcCgCXdCJcm7BVpt7uGKHAFMmX15Kcqrfz9uxxVm+WT6MbnytdrWD
         STAfsFpIHeyKwrqd9124H6fuAfxPPZ22aS5LlX/mE6byl+OTBlmhJBnx19C7QCqzGGFI
         zs+xZct8CuDXiUePqTKrFppYgO6eHCVt/jmhZjb6BQ56aH3hieYM+pTiM7clrkseUc4J
         cBdw==
X-Gm-Message-State: AOAM530/ojv/fcNLRJyBgMGX1cO6STHBNFTIsvqRXUFvF5O/nCUhrkHT
	mKDUzGE4nHMQWd6CTy8hp7I=
X-Google-Smtp-Source: ABdhPJwmVCRh/nSo8JwY6wGhgFb66Atq+7YapGPSAxjUkBI/ZPClgC+Rhb0Fvoj3MGqb8p/vAgh61w==
X-Received: by 2002:a5d:650d:0:b0:1f0:19c:a066 with SMTP id x13-20020a5d650d000000b001f0019ca066mr15363551wru.149.1647803535394;
        Sun, 20 Mar 2022 12:12:15 -0700 (PDT)
Received: from elementary ([94.73.33.246])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d48cc000000b001e6114938a8sm11496825wrs.56.2022.03.20.12.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 12:12:15 -0700 (PDT)
Date: Sun, 20 Mar 2022 20:12:13 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org,
	Peter Hutterer <peter.hutterer@who-t.net>,
	Jiri Kosina <jkosina@suse.cz>, stable@vger.kernel.org,
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] Right touchpad button disabled on Dell 7750
Message-ID: <20220320191213.GA7905@elementary>
References: <s5htubv32s8.wl-tiwai@suse.de>
 <20220318130740.GA33535@elementary>
 <s5hlex72yno.wl-tiwai@suse.de>
 <CAO-hwJK8QMjYhQAC8tp7hLWZjSB3JMBJXgpKmFZRSEqPUn3_iw@mail.gmail.com>
 <s5hlex61hwu.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hlex61hwu.wl-tiwai@suse.de>

On Sat, Mar 19, 2022 at 09:10:57AM +0100, Takashi Iwai wrote:
> Indeed the first patch caused the wrong button mapping.
> Jose's revised patch was confirmed to work fine.

Thanks for confirming that the patch was tested Takashi.

I just emailed it:
https://lore.kernel.org/linux-input/20220320190602.7484-1-jose.exposito89@gmail.com/

Jose
