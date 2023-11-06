Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1891EB2E
	for <regressions@lists.linux.dev>; Mon,  6 Nov 2023 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dneg.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dneg.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dneg.com header.i=@dneg.com header.b="sOS/4YLx"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7b91faf40so50416517b3.1
        for <regressions@lists.linux.dev>; Mon, 06 Nov 2023 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dneg.com; s=google; t=1699268761; x=1699873561; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8eQFXRz1+eVeUVTUJbNVUI35xFRyhK0H616uICMypvQ=;
        b=sOS/4YLxqe1rZWJxc5w2G8MqJg/XBjUMWFIC1STTlC2Z4M/Drg2wCSNxwBNjOoftBB
         q25ljQ8I19DiYXJbo3D2l3L/Hiu2v69o9Fmk2jjzUfO2cIxuTf6MBJXmPru8idJSZ9fJ
         LWc/pejTREEbfQVRHgNDuBM5sUYG280oHO2RfIqJmTuNljB+Z13JNqm/2uuD80gztxFE
         rMHhw4P8hjMZDIT8jmeoD0Ni/ooFn+UtwgN+vJk3mH3yMSamV2m23spHBPHACjKu97Lf
         6pxFfZ16/abtH0IuqAsTcoZvugfhY2kznRvYAIvM+DBjIwAjyjyAdrYg6NCVyMJ5JCan
         PkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268761; x=1699873561;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eQFXRz1+eVeUVTUJbNVUI35xFRyhK0H616uICMypvQ=;
        b=VOgFnOn/xYeGD0LuxABfhN1UYXrIFOVY19gSF2UqhEbQ7PZ5JaG1H6qRGcX6eBGr90
         EMS2RMflKgfLHSLX93afGvNCP0cAS0AlcvMr2BYa/H4LdGTBnHMhQP8bUxBDXhs26ax9
         oY9H3Omo0GBdWBA5nhk/IGGgdZebcKKmRbceAcYJ4rZKeoK7KCfBOWkDDHfWcOW9GaKF
         7g+ZZQAD2K/rzVxx7i9oUunhMEnZCu7VOXsX07ydz6M0iRTpF2LBO11wM0oMD+PFfPHC
         iXA3UageF8X2gcapK5NXsjDBXUzjDygOPjpvghM5tZMxNKJRrVzRbCRv76f8oRR9Ay+m
         tL+A==
X-Gm-Message-State: AOJu0YxKwC35Qyk1efbg7CEdDxag/lIa9Z8JKYLzW0QHySJ2Xg4Dw4Z/
	n8c8hHzAf7rHEWxgUG2OZjslKZXJgvkNV7I2cNZ4pg==
X-Google-Smtp-Source: AGHT+IE9DdV8iOIkYb9W2P8pTvIS1a446QZ1sdtujw1ecGskNEqrDzyo/haVtqjkLdXyAtoYrvu5NBp9w99wnRL8noY=
X-Received: by 2002:a81:9b11:0:b0:59b:f18b:efa0 with SMTP id
 s17-20020a819b11000000b0059bf18befa0mr8842738ywg.36.1699268761443; Mon, 06
 Nov 2023 03:06:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPt2mGNPSi-+3WdeMsOjkJ2vOqZcRE2S6i=eqi+UA2RmzywAyg@mail.gmail.com>
 <ZUT_W8yoJ5wqSvLv@debian.me>
In-Reply-To: <ZUT_W8yoJ5wqSvLv@debian.me>
From: Daire Byrne <daire@dneg.com>
Date: Mon, 6 Nov 2023 11:05:25 +0000
Message-ID: <CAPt2mGNYQwd6S90NXU8p+SDufCUmTLqKQb8MuB+s-hr=1g3uJw@mail.gmail.com>
Subject: Re: autofs mount/umount hangs with recent kernel?
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux NFS <linux-nfs@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Chuck Lever <chuck.lever@oracle.com>, 
	Jeff Layton <jlayton@kernel.org>, Trond Myklebust <trond.myklebust@hammerspace.com>, 
	Anna Schumaker <anna@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 3 Nov 2023 at 14:10, Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
> On Fri, Nov 03, 2023 at 09:40:44AM +0000, Daire Byrne wrote:
> > Hi,
> >
> > We have large compute clusters that, amongst other things, spend their
> > day mounting & unounting lots of Linux NFS servers via autofs. This
> > has worked fine for many years and client kernel versions and was
> > working without incident even with our current v6.3.x production
> > kernels.
> >
> > During the v6.6-rc cycle while testing that kernel, I noticed that
> > every now and then, the umount/mount would hang randomly and the
> > compute host would get stuck and not complete it's work until a
> > reboot. I thought I'd wait until v6.6 was released and check again -
> > the issue persists.
> >
> > I have not had the opportunity to test the v6.4 & v6.5 kernels in
> > between yet. The stack traces look something like this:
>
> Please do bisection to find the exact commit that introduces your
> regression. See Documentation/admin-guide/bug-bisect.rst in the kernel
> sources for more information.

I tested the v6.5.10 kernel and I can't reproduce with that, so I
guess I'll start the process of bisecting between v6.5.10 & v6.6.

It takes around 24 hours and 72 client hosts until we see it happen on
at least one, so it'll be slow going.

Weirdly, I also have the v6.6 kernel running on a different set of
hosts and they have not shown the problem at all. The only difference
being AMD clients with higher process concurrency = bad, and Intel
clients with less process concurrency = okay.

> >
> > [202752.264187] INFO: task umount.nfs:58118 blocked for more than 245 seconds.
> > [202752.264237]       Tainted: G            E      6.6.0-1.dneg.x86_64 #1
>
> Can you reproduce on untainted (vanilla) kernel?

Yea, I'm not sure what is going on there. Some compile issue as it's
the "deflate" module complaining about a missing key.

> > And like I said, the mount/umount against the server hangs
> > indefinitely on the client. It is somewhat interesting that autofs
> > still tries to trigger a subsequent mount even though the umount has
> > not completed.
> >
> > The NFS servers are running RHEL8.5 and we are using NFSv3. I also
> > reproduced it with a fairly recent nfs-utils-2.6.2 on the client
> > compute hosts.
>
> What distro on the client?

It's EL79 on the client but I have updated the nfs-utils to something
more modern. I have not updated the autofs package though.

I'll report back in a week or so...

Cheers,

Daire
