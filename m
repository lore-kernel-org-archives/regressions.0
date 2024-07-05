Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4F4144D22
	for <regressions@lists.linux.dev>; Fri,  5 Jul 2024 06:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720161049; cv=none; b=Blg4XCW+ayDW0Hn2suxQgrtnabZ58eGki7NttiGmXClrTJJgvZk5nO/uvJEygIhLeRj4hGLncamFReYig4DFzWQYFfhLJQnZSKfpKCF6XMAVu8/dRWNkzp+AZDUKI05IpYST3vGcriI1XCQLsKThcaUM8ujLLHS/oINciVp0xyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720161049; c=relaxed/simple;
	bh=3y1kYHHnYGzeD6Wz0nY/wCVLnjXbc4LLizc2QWYCsb4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPV3CxccwKAHPadFeyMiw95U1AwB23jdVEHdt2EpnvvZn7jp9ueOfY8uDn+whQdFUxHvhrEOdaE7yvdXYVUeUqacwbSIWZOhgM8cdv5V///IobXSuo9yNdtMLwL4ynlWmfcXoUQ7fssC7r1g6xifLihqanhkHiN8HFeWj5/J8jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fM3RemUW; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fM3RemUW"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-64b29539d86so11262427b3.2
        for <regressions@lists.linux.dev>; Thu, 04 Jul 2024 23:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720161047; x=1720765847; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQbhl45iOUg0QGUWvg2xNxmieezt2A1bnLf0za/XLZY=;
        b=fM3RemUWm8CvpDCCzKk62CJiG8IKDItGzU8AyBT8hiuBsObLvlgOwYuFuh8j+8Ddhy
         MRDWupU/CtLsGjjngBgNSs9iZfT72nKZ4tjxFWgnAKw4b4Ar8DAVPGDgBBRft7qLvnKg
         A22Zns1KfBytngy2tKY3VtzS8qE7DChZzM5YqOOEXK8lB77dGydeKu7FWD40yRiB8EG+
         u8zh+C66fZbkjy7UqzNGhzOeBWIuuRhQ9ILdCAdME81BFCg3xxxSi2uDDQ8hckE8+6ST
         RcIYhIltRoqr2KhG53AItNvbVVSXtvWhgtdCDQLLXGVT1IB5rxODZTJqCvLTFqC2Ize7
         V/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720161047; x=1720765847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQbhl45iOUg0QGUWvg2xNxmieezt2A1bnLf0za/XLZY=;
        b=RXQvqEhEx5i2QjDaCsAMydo4/N78XaWUFaC2cxqpKzbLYOI7JCjbe5rE6LQmc387tm
         zpvv/j9YxwrF30+GEGuLGkul5gFikafuUTaS3EQXeZQYjpcMyDiHoRt0kECRXcLWOBvY
         MftWvE2jH3FbMasSOynL1osYaF7cDSn/2ni74z34zOwI8P8YR9fU+yMmtG4SasJpA2F7
         +vL3OFmS/3Wfk9GqeAf83evnd9vB7c4i7tzayzOwtBE+zMmlWM8ZUgxw4LvFCexQx8rR
         X8sPitfFAmslPVTCeupCNGF29x1TxI9yZMpwFsaPx0ojuM9eB3tOoIvqekhMdrjdUiem
         NIUw==
X-Forwarded-Encrypted: i=1; AJvYcCW6z0E0na6EAm32GA9vcgS5tts6tZVcQt44tX9lw0OU9uFQT0MPIILktbe9XPalAMe9WN2megOCjgncNWth2gfUkMyyEWJK5ZXkyig=
X-Gm-Message-State: AOJu0YwKbmdRdUAbQPjRYJttM1UmdJXVOpjN1LIncl1jsEWQLY+W8DLJ
	djdgf8iyoGQoyPK3qkVxNfToTftQsqFR0diyV+b4y+WAskimcFKqSypWMtUyugCeJ7iJ+qhXqyc
	WK118PtbJABiV+kxx6Juf814AUh4=
X-Google-Smtp-Source: AGHT+IEb2d4TYFx4dcPUM/2H6DuAxz2Xagt477hoH4hD4d6CeTKaXtpWV6ii11wwbYejeouG4e95xSVT7l9Y54yfW1k=
X-Received: by 2002:a05:690c:3382:b0:627:d92a:bdc0 with SMTP id
 00721157ae682-652d7683982mr46295877b3.36.1720161047227; Thu, 04 Jul 2024
 23:30:47 -0700 (PDT)
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
Date: Fri, 5 Jul 2024 08:30:31 +0200
Message-ID: <CAK-xaQYwgOKkeD4HvMtNqNqqchW4aS2gtvzGJ-yKwfE6uaUYng@mail.gmail.com>
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
> 1) First let's check that the problem is really a consequence of the shrinker.
>     Try this patch:
>
>     https://gist.githubusercontent.com/fdmanana/b44abaade0000d28ba0e1e1ae3ac4fee/raw/5c9bf0beb5aa156b893be2837c9244d035962c74/gistfile1.txt
>
>     This disables the shrinker. This is just to confirm if I'm looking
> in the right direction, if your problem is the same as Mikhail's and
> double check his bisection.

Ok, so, I confirm. With this change, just a little bit of PSI memory
sometime (<3%), but no skyrocket. Also, tar at full speed.

Now, I'm going to prepare the btrfs image to send you.

The other steps later.
