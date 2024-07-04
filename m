Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D548A44C7E
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 22:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720131320; cv=none; b=PjgCgO14F6FO9tzBh5z7KMou7oJS5zaPbvU+n4ETvtM1e6rZcWXl8oYFXSID2LY6hmjXsbuXAnUQatYFcYJx0JXK3OIYyzA2zLPtVYmASExqhgT0i/B1Z1CFzu5XWrLiSwCCuUm9i5pOCw0vDtL7ugGc9ae/m8+ZUBOPjHrrAoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720131320; c=relaxed/simple;
	bh=67Gv27oRvUM28aoRGZ2xRjsYjiCrsxJ4J7h+O1P7zME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M3GEO1DYTIABYsKYWuR7wE6rhxks2mg0gTkJ8k2eEg9MUa1meB+gTSeFAA7lVQdagVA9uIk09AqrRohgm9sSVUwWQpLLDU6IEX44hBTWXg1kOlb8SGjJPLS1HbQWWjT7U27pkMg9Dk4HAY7GSJBikdTy9sNSW2K0hIVqkqsqtGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMLNaOe7; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMLNaOe7"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-630640c1e14so10601937b3.1
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720131317; x=1720736117; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oxXjn/jIsgvTSGdEC5QHKUrLmHLOo/k7SsI87His1V8=;
        b=OMLNaOe7AzroFwzNwvfHw16Lhm3v1GSB48Y8aXHtMSAIYGwrX3i24GEjgwftdWQVeh
         Mr+GWk1QQH3h2OOfZh2fdhZx/2jVmUwLc+WXloa0SCH8GP0Eak3rJB4kk9kCt+kFsgD4
         QtLsigdunB4ucrTtuZLRxMfokrEb4iYEW0BQVw/L3wUTZt6EMG7h8MBLKkqkg0sueidC
         wk2YvcDJS5ggs1l49hlbI8CrW0V//qLRtUC7+RR1HRQOo1iSJ29CR+CX138ZIdr+ItIQ
         /1UQ1ApdT/6RpEY689FR/R4sO7UPjlMn+uK4iObA38oq7Tce3WrYbMqOHMhnX/dKfNwQ
         aqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720131317; x=1720736117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oxXjn/jIsgvTSGdEC5QHKUrLmHLOo/k7SsI87His1V8=;
        b=SEARiIXQxb+u8nmVvCvohlfYykYDQXacWle50Kam8tE8q5aKZqbTbxcXDdFfg2LOwT
         cE647fK5Ol6BHN8BE6+4GmQOd6xvIBqZx5dar2Gyl4jHHLzTc8Vb+B4jj3MCsr568Ru/
         psYXyQpsUGvXqGvbvaOE5Akwm9wr2J/rXLtshOvMnBNZnd/beqrl2CxGsWd3DSt2tiBd
         nDD2rLwZgKHXsIbtDDYfT4T0nb6iDVunukf+NGpPXWn6q9AIVIY6s2rykAX1LkvrbThq
         d44IBrBVjZa/F7T713GzKybocG898v2uVO/C7Dh/tRS+v1y52LUK3d9ucSat4g7j5i68
         zPrw==
X-Forwarded-Encrypted: i=1; AJvYcCXgSA/JLfuzDhIn5prT/7RYZgmGzOTdrNuK3dOwCMsIJzImEJ5NFLPkT40uxU91AZ5krk58G5a1pEDw9Ezi11bvSDoUhTaIgB7O6gg=
X-Gm-Message-State: AOJu0Yxf7d/RxfP4qdiaxg6kAM2+OQMZbqyMk1MzaB9nz121UejnqiCq
	odAc9C627TjB59XPV3vDL/tU45faMNJHND7VMu56jDUU3UwK3cXCgD40H1UEw5/ok/XUWdhwK5f
	YZI/VRqWjAqNnlDxm9UKJJEszQ8M=
X-Google-Smtp-Source: AGHT+IH613J1GVyVRVdw29iI1LtkdZWWQUclw6lnVqPqVppzm0gPrW066fO4DgEKjI1yqYnu2Eas4yojnFsHo8oObpk=
X-Received: by 2002:a05:690c:812:b0:649:fa54:1f8c with SMTP id
 00721157ae682-652d823eae9mr27342717b3.48.1720131316740; Thu, 04 Jul 2024
 15:15:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com> <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
In-Reply-To: <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Fri, 5 Jul 2024 00:15:00 +0200
Message-ID: <CAK-xaQa2NP0kfwQZoko-FUsSCbW31F1S48SJy8+94aSs7PCd3w@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 19:25 Filipe Manana
<fdmanana@kernel.org> ha scritto:
> 2) In some cases we get very large negative numbers for the number of
> extent maps to scan.
>     This shouldn't happen and either our own btrfs counter might have
> overflowed or some other bug,

Well, I was thinking about my specific odds, and I tried this:
a) kernel 6.6.36;
b) on spare partition nvme created a new shiny btrfs;
c) then mount it forcing compression;
d) multiple parallel cp of kernel and libreoffice src;
e) reboot with same rc6+branch already used;
f) tar of the new btrfs: no problem at all;
g) let it finish;
h) tar of /.snapshots: PSI memory skyrocket, and usual slowdown reading;
i) stop it;
l) again tar of the new btrfs: no problem
m) repeat a few times.

You can see the output here:
https://asciinema.org/a/rJpGWvXYH6IDBXWYhtJckkKWo

In the end you see I kill tar and let the PSI going down to zero, if
you are interested.

> Ok, so maybe I missed it, but I haven't kswapd0 in there, or nothing
> taking 100% CPU.
> Maybe it was just Mikhail running into that?

To have this effect and the extreme luggish response (I mean, click
something and it takes more than 30 seconds to react)
I need to work at least one day on my laptop. At this point also
cycling to virtual desktop takes a lot.

Thinking about my different use case:
a) i always suspend. I just reboot when change kernel. So, I can work
for weeks with same kernel. Suspend2RAM, not disk, btw;
b) months ago I let run beesd for a day.

> So I'm surprised that you get an unresponsive desktop.
Same point as before. In this case is not so luggish, but - i.e. - if
I click for screenlock it doesn't start immediately, it waits for a
little bit more than one second.

> Interestingly, here the memory PSI stays at 0% or very close to that,
> it never reaches anything close to the 60%.

You see the same thing with the last test with new btrfs partition.
New partition: ~0%
/.snapshots/: near 60%.


> With htop in parallel, the bpftrace script, and since my htop version
> doesn't show PSI information (probably an older version than yours), I
> kept monitoring PSI like this:

Well, mine is taken from here:
https://github.com/htop-dev/htop.git
Compiled with:
./configure --enable-capabilities --enable-delayacct --enable-sensors
--enable-werror   --enable-affinity
And tweaked config file. If you want I can send it.


> So several different things to try here:

I stop here for the moment. I have to sleep.
In the weekend I do the rest and reply to you!

> Thanks a lot to you and Mikhail, not just for the reporting but also
> to apply patches, compile a kernel, run the tests and do all those
> valuable observations which are all very time consuming.

My little contribution to free software!

Ciao,
Gelma
