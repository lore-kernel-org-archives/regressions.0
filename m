Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A814276C66
	for <regressions@lists.linux.dev>; Fri,  9 Feb 2024 16:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707496152; cv=none; b=PI0K/pRpbRttVpr+i6jcHn3PXeCYIUeZZLxDlvdCOkd23yrdf9LaHPdWgCyBDl26i02LxYbUV7q15YEvI/nAXCinQwphTjPzyXzft2z9302bO2MSM74/7PpsYblQaUEbcTmYMxIZNkEIpQ0Dsu4mQGwBo/sCI+Zkf9HdNlUFWRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707496152; c=relaxed/simple;
	bh=kVG4rmAX1MzvfP4plhvh6t2XV6btpWEjQfp2YBQC/uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ3t5XF9sIJHbdZEG4CWHfhuJkiXUr+WtDXQhfSpffR+nmPufjxz8hxNb7XNG+xH8rsa0HCZRa4VxVV2wbOw0Ht8vEQckH+yX/xxvC+6jBSLfnGF5gEpFMzwvKvEX5FWdnH9DLAX392yAJk85du4HhzcqI68Y9pMxDcfER5ogNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NeUm0dyH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NeUm0dyH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5611850388cso1364667a12.2
        for <regressions@lists.linux.dev>; Fri, 09 Feb 2024 08:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707496149; x=1708100949; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kVG4rmAX1MzvfP4plhvh6t2XV6btpWEjQfp2YBQC/uk=;
        b=NeUm0dyHZm6/LTDHNLdFX7aYEVFXvlNuEB2XYd5RGuj8QY8SNOus01ifYo5Sv50azb
         zrj1DfF4JCax3Lq0AvUoOTWLGdDZEBNnWnEIMAV1J6+hSE1ZJbEmmzLot7zwqORFaQFJ
         xoCVzPd/cEcHhiS0h01nwFi2zGmzIJ6Gwter2NxQzFINl+nmEj1EUIIuJU+8lz8c/UHE
         OzgEAbrr8hdFQiKI2BmAAr2+edY2fVVCWlX6oXZYig5R78zzSFtQhanHB8+IPO/epZka
         npW14afJ1zkTjKhCr/4e+oC8FvV1ZFXClSNLiHbAN72RGdsfBlrkdqV/sa5E8exwFG3e
         pZBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707496149; x=1708100949;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVG4rmAX1MzvfP4plhvh6t2XV6btpWEjQfp2YBQC/uk=;
        b=LG7Z9cr0tQAGRHGe3n1QPQzed3HQJUteLy/i/2iaPcanAC2oEYT/DerxRowJOZ+CFt
         iqB50H9pltVUyHj12p3RUgfPSS2rQFgEGKFBjsGPJVon/+qbzQNLd7/lTMHQXtkMuWlN
         CiQAEnVcYsnLzhwp7IUIM9OHzcai8/rBFt4TLltJUqJ+cC3qzTC+Hj8CahqP4oJbRjbO
         mGh9deJHyDaTGli+rX6ZsFUHqzPxaMH1+gNiGtWAoI6WZpjZQmamkm9IU01I0wofY3WO
         k/zvKOywnzzmhRnkxOs5fiIzgZwWB2SO4aS8hR1AoRyMXejWo7EEsGe0HxPvI4LuRBBd
         QD4A==
X-Forwarded-Encrypted: i=1; AJvYcCUkP9l2syKiXn0J5HK8cYoeeb3zHBZdlqVmqpekNUXXhEjT6bK+Y7AdfUoBsIG7diYQ53rpV348aZTYR4LITgAeLhB9aIWUKmaItZs=
X-Gm-Message-State: AOJu0YyjnIlR6J3j/srjAlDb6pKpLxE274EaqiXqoyNa1tRvFMldZlas
	OaBJ2SKlnDcbehwNwbdB5TAdi46DzQ7wGpBx8bG5ejy4LMkz1oPu5U3fzsBUdXhMkrliW2alshV
	LNWKefDpgzyRYT9av7IBgPwJBLGYtVrx2W+lK
X-Google-Smtp-Source: AGHT+IFIjW6afRZSpR9rGbKLm/rdPxyNG0Z79tvHaAuAYu4k5p6b6BVAISbXhE/E21/MzIbNn74/BFd1oyH24+ZmDyE=
X-Received: by 2002:a17:906:2b53:b0:a3c:177d:cb1b with SMTP id
 b19-20020a1709062b5300b00a3c177dcb1bmr43168ejg.10.1707496148741; Fri, 09 Feb
 2024 08:29:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <38f51dbb-65aa-4ec2-bed2-e914aef27d25@vrvis.at>
 <ZcNdzZVPD76uSbps@eldamar.lan> <CADKFtnRfqi-A_Ak_S-YC52jPn604+ekcmCmNoTA_yEpAcW4JJg@mail.gmail.com>
 <1d4c7d06-0c02-4adb-a2a3-ec85fd802ddb@vrvis.at> <CADKFtnQUQt=M32tYhcutP0q6exOgk9R6xgxddDdewbms+7xwTQ@mail.gmail.com>
 <CADKFtnQnz0NEWQT2K1AGARY5=_o2dhS3gRyMo-=9kuxqeQvcqQ@mail.gmail.com> <cf6b1264-8639-46e7-8dae-5aff0306e958@vrvis.at>
In-Reply-To: <cf6b1264-8639-46e7-8dae-5aff0306e958@vrvis.at>
From: Jordan Rife <jrife@google.com>
Date: Fri, 9 Feb 2024 08:28:56 -0800
Message-ID: <CADKFtnS3gkGWfwD80intR906y4Hn39WHOraY65mFtqzE_-iMyw@mail.gmail.com>
Subject: Re: [regression 6.1.76] dlm: cannot start dlm midcomms -97 after
 backport of e9cdebbe23f1 ("dlm: use kernel_connect() and kernel_bind()")
To: Valentin Kleibel <valentin@vrvis.at>
Cc: Salvatore Bonaccorso <carnil@debian.org>, David Teigland <teigland@redhat.com>, 
	Alexander Aring <aahringo@redhat.com>, 1063338@bugs.debian.org, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	gregkh@linuxfoundation.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I sent this patch out to stable@vger.kernel.org. Everyone should be
CCd. Thanks for your help in confirming the fix works.

-Jordan
