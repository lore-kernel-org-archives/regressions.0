Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8AD41A81
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 13:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100844; cv=none; b=pneqkweqwDGmB/Khpnv0JXMrE20MZWSmDfeq8ef1EDf7Xws5/tVRqw21nhpr3m6G+/bah2WTvka0bPb0FCOlJL18qy1IaAv0ipYctIqxL96RoO+PXYIJzi7VgwvoUAVg/mr9Evdu2OlOvyslvRbJQS3pyRHepsikkN0NFGO40oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100844; c=relaxed/simple;
	bh=UI3dF8OYMSUWU9X9suKWJKp7BkGBDJB8qJBGh0o1NCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H2EbjMRQfBqG/Acictv8BkKgGMER85/PNQbdDAZ7dX4lkq0E9oF1a3iPLOXyauOApipFExGJKMRBXI5KGubIsw6Qgya/WtMpdOYvgkr9sHaIr78lD9K8f66L//nwNhcWsZk7hfP9348LiPPGe5W1xG7+2ma357Zzp40YigpoBTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jFdU0Let; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jFdU0Let"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-643efaf0786so5662277b3.1
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 06:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720100842; x=1720705642; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UI3dF8OYMSUWU9X9suKWJKp7BkGBDJB8qJBGh0o1NCQ=;
        b=jFdU0LetPdoRwpEtVppqnA8w1Mh9sjSTqRceQyQeGORwyyKAUOOKfdXTphIBl1hGaG
         scZC06R9Ut0xtB0beDrHSFffOxcYPsmVNHDh8GFW/ouJ0MfYcGmcBc8YD7Vj0c8FOVWy
         eTMjKpQ4RaSbXT4atRKmQLUY89O0wXR+9VEnZB3ttDNtq+99d4VXK2p9qQnB6i/fO32o
         RxJ2biYHXQp4CvEd0MFb+sX/02UmjCCAqJiZhJnfA1E7pkQPqPiKvuq/9n2iaFoXGiFH
         oarl+FmfWV+vFW0ntTT30fUiKhLqBSigt9CTYY5YsbKtVmFBO2Tl0I8rOUF1efqn/k7+
         zlCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100842; x=1720705642;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UI3dF8OYMSUWU9X9suKWJKp7BkGBDJB8qJBGh0o1NCQ=;
        b=hKzJyYNCYtB1JskgPqqodut8cGpsjt3cCTksUuLXlS/IytuZDtiU9+rOS+LNLoWJ7s
         DecECcdlTctZFK6cCgbEIk/wDprULFoZR8SE0dHuFhfsLu0tU71HnGwnhxsLx64zQLNS
         JTbPAKWH/89twGb93dGPNknBo6XrTI55EMhOmWkmmm6SSeiiGwfW3Luq3nEOLEiW26Qf
         pddtuGDWkJieiWB24TIZrGhFjkTeAJmSheLY+cqi1BP4T2PCGKgA9348sWuisQcda/f6
         eJYVZyBx7RyVUpyDiZnu+OjVColnuFGIdPJ4V8TOoyhWFRKKxY5Uf3suNnhoYGAJ3GO3
         Qd1A==
X-Forwarded-Encrypted: i=1; AJvYcCXfw/Yzv0I+ljYBeHuku3XFKG405vCp5h9pr9kaCcE7duUgwP7etajm7IncHWUzrbu/DlBhjrwZRg3nfo0KB5TTB94DBEDV1/suOPM=
X-Gm-Message-State: AOJu0YyszbtG8EtseB0tZaNJOgc7J49HG7e0xMs8jHwTCzZAly/HluxS
	ekWD9LkTxM2jrqknQWmWPxllP7bdM0apZWw8NEMNyse2J/H45yNc2bO/5H/Wp9JXPhQh1Ri5mGA
	7xea5OXtQe8OIwkNTZqLo0SRtdy8=
X-Google-Smtp-Source: AGHT+IH6YM6GLafKg9XBe0axWFXO3AhGkvxdQYhJOJum9ZzTHvtWe5dJcPzvzcyam1htB/hWj7nXRx0+wUWo96dItps=
X-Received: by 2002:a81:ab52:0:b0:62c:c65d:8d1c with SMTP id
 00721157ae682-652d8636094mr15666627b3.52.1720100842308; Thu, 04 Jul 2024
 06:47:22 -0700 (PDT)
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
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com> <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
In-Reply-To: <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
From: Andrea Gelmini <andrea.gelmini@gmail.com>
Date: Thu, 4 Jul 2024 15:47:06 +0200
Message-ID: <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 4 lug 2024 alle ore 15:33 Andrea Gelmini
<andrea.gelmini@gmail.com> ha scritto:
> Well, I have the nighlty snapshot (well, it's not on every subvolume
> of the fs). I ran tar on that, and we see.

Well, using the laptop for daily work and running tar on snapshots,
recreate the issue.
I am collecting the htop output and bfptrace.

I send you everything when I collect enough data.
