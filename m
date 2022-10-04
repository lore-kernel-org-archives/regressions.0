Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A164419
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 19:24:12 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id w2so8751848qtv.9
        for <regressions@lists.linux.dev>; Tue, 04 Oct 2022 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=UGv+4Ut0HLLEjpaUAPUVZXaZ900gJu9AykveplMCL1U=;
        b=URvG7DwIubm3/EQ91sUr7I/IZcR0Fhyn+9ZTW+dQQr9NpmeWjM6ahJZObGsJ3U0SiB
         g3p7kThvV4Jq3HV0K0aeEhaDa8gR+gQyU11rYMjBUkgDwmi1+V6eS0hoVnb5xn4/RmNq
         oCN7gfhRM46mNb7BZR8+tN7a9LRWayvP8oW3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=UGv+4Ut0HLLEjpaUAPUVZXaZ900gJu9AykveplMCL1U=;
        b=7Jwon8PpgkAtE6dwuvWCDfTb+xAkK8HlM/IqikeWXeLazL4IFfHvNmIdcei1vY0bHJ
         g8v2IwHJvYbLdRZbvHzslhWkKvsmrHs8v2Lbv0y2savjpk5Ntqsd1FiZL7hMb63nDbd8
         1OBegRg+oBrcfDNjoG+CumE93DpuRHDkvTycMwT/Dl+woAMAIoLv97sTOAf8A1nIBc+p
         G2MAku8lUiasfALq3tkP1kM0fVBvpeR3dqegkw+CB+eRWiD4gPeDjohop0qTnBXpx+Oy
         yUIDaH1Vbvg493Wlg59eXzooPj1ZO+/AmFeMxLsvPoQwIR/8vdFm5HX0l9w5ulxVNZXA
         vEpw==
X-Gm-Message-State: ACrzQf2nOnfkzz/OiPHRBG60QFm1Zpilf0TPWjGf9Lw0trdpXDuQNYjT
	Pj16g0yDZ9ql8AkqZf6gMv3B2g==
X-Google-Smtp-Source: AMsMyM7F6US4MHrT1SRGsB2cYTu7Yy8NeSol1EU/9LJMbcPgPun/zAiBU19d8ou6TvWTXeuJMMX5Gg==
X-Received: by 2002:a05:622a:180d:b0:35b:d283:7e65 with SMTP id t13-20020a05622a180d00b0035bd2837e65mr21012590qtc.106.1664911451349;
        Tue, 04 Oct 2022 12:24:11 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id d10-20020ac851ca000000b0038c60a3fa8bsm1075495qtn.85.2022.10.04.12.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 12:24:10 -0700 (PDT)
Date: Tue, 4 Oct 2022 15:24:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thorsten Leemhuis <linux@leemhuis.info>,
	"Artem S. Tashkinov" <aros@gmx.com>,
	ksummit <ksummit@lists.linux.dev>, workflows@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
Message-ID: <20221004192408.z6gxc7unclm7vbdg@meerkat.local>
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
 <87fsg3s8co.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87fsg3s8co.fsf@intel.com>

On Tue, Oct 04, 2022 at 10:21:27PM +0300, Jani Nikula wrote:
> As to bots, one idea would be to go through old & unchanged bugs after
> every kernel release or so, ask to reproduce on the new kernel, and auto
> close if there's no response within some time frame. This could be very
> relaxed for starters, but would start closing all the stale and
> neglected bugs that have crept up that are of no use to anyone.

This is what Fedora does, and I've always felt it creates more annoyance than
good, but if that's the consensus, I'll be happy to implement this.

-K
