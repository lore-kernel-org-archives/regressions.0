Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BD29465
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 21:53:02 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1ae3f6e5d70so1678175ad.1
        for <regressions@lists.linux.dev>; Tue, 23 May 2023 14:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1684878782; x=1687470782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Im/fXNrdtdh448/x5vPWa+KOEv9ipXtehLMOS6lDlss=;
        b=uZAsBWtqR4l/fFgleDDi1e4cBPSXQn6MLIkXNqldkh28u96vZVG4S7tzPCzjl8kkk4
         3sJyz5LXU3JCKwd5EXZLOTHGXqfIl4DvHwuILOtZ52f/l7yIcByUZyQBjXo9+O33Jraa
         ETqCVuFWhNVNkGO1s7/KXoFztBAMw8K7NZnNxxJuLMx7pKWNRQ4KLBfcCiOxwkbZssU0
         axah+nx/7Fv1Lcm+U+7PxW5IR5/Xl4jTypJgk72uOnPsQeZ1DnB6hGWZ6QbVgHYJ3N9C
         6vvW8ymvWcbnIGvR1peDLbdyaGLWeIwCg52h/tmIB/hGoq5rqshphSWZQMsjIXBvFck2
         v+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684878782; x=1687470782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Im/fXNrdtdh448/x5vPWa+KOEv9ipXtehLMOS6lDlss=;
        b=Erutpsfv9IxIGQ6wH9wgZE5GD1RTwiyeX1lIisabjsBrL3x14wfbRloSRIBEws6uxR
         e+CwIb6hwDw5DPU667KILjmW4+WNyTNi4fRmvtA8krHDNx7aQdClWlfI0Qdm+fjyFHfN
         ynko8GRMEpXTrwja7evt8MalJfZQ0ol/uR/sN597jNXZnP6g1b8pKeKn6pG4KH6sbsX7
         gduKI2pLgvzSKqeT394LvMiUpMq8RWJ2Aye1byDG78dLLI9RrbOl3vYE/D2QFHs6oaUl
         xF/FZp4IyzMTHuXpI6nMfE74cblFSzPocbqNfU1xUh0lDaLJpIiz3jJVbsjeE3+dml7/
         jbiA==
X-Gm-Message-State: AC+VfDxA9PppbH0m9OSfDxF+DUbaLgPVFcMDuWtDFpAxCJeTeES6O47b
	v5lvyXvJRIgYMnxYK9Wecmtsow==
X-Google-Smtp-Source: ACHHUZ7fyzANrlD5gDYJjywUoAY1KKzWqRPDkZMuU5ssh+xI2BalbzVXVwX1qAbOA/A/CxsEdUYjEg==
X-Received: by 2002:a17:902:c40d:b0:1af:ddef:f605 with SMTP id k13-20020a170902c40d00b001afddeff605mr486823plk.65.1684878782390;
        Tue, 23 May 2023 14:53:02 -0700 (PDT)
Received: from dread.disaster.area (pa49-179-0-188.pa.nsw.optusnet.com.au. [49.179.0.188])
        by smtp.gmail.com with ESMTPSA id j16-20020a170902759000b001a6a6169d45sm7279540pll.168.2023.05.23.14.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 14:53:01 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
	(envelope-from <david@fromorbit.com>)
	id 1q1ZwB-0035VU-0I;
	Wed, 24 May 2023 07:52:59 +1000
Date: Wed, 24 May 2023 07:52:59 +1000
From: Dave Chinner <david@fromorbit.com>
To: Pengfei Xu <pengfei.xu@intel.com>
Cc: Eric Biggers <ebiggers@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, heng.su@intel.com,
	dchinner@redhat.com, lkp@intel.com,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [Syzkaller & bisect] There is BUG: unable to handle kernel NULL
 pointer dereference in xfs_extent_free_diff_items in v6.4-rc3
Message-ID: <ZG01u5KGsCBnWVGu@dread.disaster.area>
References: <ZGrOYDZf+k0i4jyM@xpf.sh.intel.com>
 <ZGsOH5D5vLTLWzoB@debian.me>
 <20230522160525.GB11620@frogsfrogsfrogs>
 <20230523000029.GB3187780@google.com>
 <ZGxry4yMn+DKCWcJ@dread.disaster.area>
 <ZGyD8CNObpTbEeGQ@xpf.sh.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZGyD8CNObpTbEeGQ@xpf.sh.intel.com>

On Tue, May 23, 2023 at 05:14:24PM +0800, Pengfei Xu wrote:
>   I did not do well in two points, which led to the problem of this useless
>   bisect info:
>   1. Should double check "V4 Filesystem" related issue carefully, and should
>      give reason of problem.
>   2. Double check the bisect bad and good dmesg info, this time actually
>      "good(actually not good)" dmesg also contains "BUG" related
>      dmesg, but it doesn't contain the keyword "xfs_extent_free_diff_items"
>      dmesg info, and give the wrong bisect info.
>      Sorry for inconvenience...

I think you misunderstand.

The bisect you did was correct - the commit it
identified was certainly does expose the underlying issue.

The reason the bisect, while correct, is actually useless is that it
the underlying issue that the commit tripped over is not caused by
the change in the commit. The underlying issue has been there for a
long while - probably a decade - and it's that old, underlying issue
that has caused the new code to fail.

IOWs, the problem is not the new code (i.e. it is not a regression
in the new code identified by the bisect), the problem is in other
code that has been silently propagating undetected corruption for
years. Hence the bisect is not actually useful in diagnosing the
root cause of the problem.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
