Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBBA6FE09
	for <regressions@lists.linux.dev>; Fri,  5 Apr 2024 13:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712322829; cv=none; b=d7Hp7WOeCwfI6VvZ8YV2uFqDJXWlNFtUZJ9/1Jvrj2UTaNWrWeA874gljuLjQyIRqW91etVJ6l24pZg17ZG5L++dGvMPSzmAk5v/1IlUQKIH+7X2sUhVmh63V2GCKQrsmUR5vwOEr0TqfutTno+67pT8RIm7HZQuZYCxwcZUtYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712322829; c=relaxed/simple;
	bh=kuMV/3T6ZFOYdnbds+4lzaSfsPnTVAQKG+lKGoR4FbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T49Ho9CyCxb47jkypRRkwMdyZNuLFPvQ6gS7TfOQpmAueVwQjC5srAW9ZeXz07lAB4QVIhIQ4/cQxrNagCsuPtakMY0VbSRwqxIXMQaWrPBBX33TGSUrdut8gIMEQ8FrIEO8c3ANleCy45dr0Zcs4oMtChXGb2nItGsrU4cCUAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xu9hbZJ1; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xu9hbZJ1"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7cc133f431fso85312639f.1
        for <regressions@lists.linux.dev>; Fri, 05 Apr 2024 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712322828; x=1712927628; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+eOwWNjATfYk+c/TB3aDWZzFnSusbmwrVL3HM1jFH4=;
        b=Xu9hbZJ1duy2hx9zl6ELybeO2PhfS+2uxJEsSFRyROHZwwjvCb7XRmU9G5sU2/s7Pu
         pxSJ4G11ZkbLAm+/E/Ebl8YMXn0wBo3sdntc/0vx2mpTJiHeWicKnwBDamPiNPdWDckP
         GMiIycVS92ZIUcO0zh8jjmGl/pumXBHS5AUtW2e5PXa7DWO4qABGEYvupimnnvG03SYJ
         HVpK29cR6lM+KHeBiqTWir+fDwDayckxLHKPR8Rw0X3c35i2JxSyBvu00jdFGhCzrV+V
         muLDyDw0bGPD53aLALAk5c30degZeMyJ635hd+FCqAuKAZSFlYidYsy5v9JCVmSy23h2
         rpLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322828; x=1712927628;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+eOwWNjATfYk+c/TB3aDWZzFnSusbmwrVL3HM1jFH4=;
        b=oKWe/esj0MR7956fl8/FHLeXrNV09MOrFyl2La1Uo/bgtVTA4dsgu/Lgdy0SYxjoZz
         SbfwoaFjJRzPjGRvfH+AEjp4fZoeb0aknCvVHet4mYs8FKANBr/ntUh+Wl4hF566N+Ve
         wxj7zsDntt7IaFCfkORQ/23kjpA9lVfErVYb6j/HGDKQvnj9McO79WtS9rG+/faGARDz
         w894XIZC8FYPRb/NKG+KasN+B/9reW/Zq492r5eaYD5NSWRcCypg7Iao+hPK6AX0OGfb
         oCfpY80INV59icsefm9rPLBAGKSz68Qt+gHgDvYl6rz/JyuwctZgv/eZ7rF0ryOKLqfh
         zBeA==
X-Forwarded-Encrypted: i=1; AJvYcCVxlbXyIQmfoluqXZxDF74MEfh4ExMS/pNTCctyuxpa2HhwPhcWLn8kwstPXAk8MFnYLh+H1jFnqE7CUNwezeV6dRd8J/SmKQcwcXk=
X-Gm-Message-State: AOJu0Yy37qFaMUXJAuVNDO6yhAmPQi6Gx4gzJSJVy9lOFGFnJbPrrYu4
	DRAC33JyIADoWep2kn9kUEf1LmyxhQtJESqRKLg0t3M0CLk0CgXLvpHUOllJ4ZN9RXdFIBa8VqZ
	qnbNCKDhf6EV2KfhlMoH5uSpnwqc=
X-Google-Smtp-Source: AGHT+IHaX2dQh+kALgdWIspduT6ugovJPa5Sn4HGaoAs9RZ6fW+NT+v+SSYkpoJ5EWsoUTSjQy/1Vw5BjcFJ1irMF5s=
X-Received: by 2002:a05:6602:2486:b0:7d5:bfc5:2a4f with SMTP id
 g6-20020a056602248600b007d5bfc52a4fmr1235931ioe.3.1712322827628; Fri, 05 Apr
 2024 06:13:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322162135.3984233-1-steve.wahl@hpe.com> <ZgABC1oQ9YJW6Bw3@gmail.com>
 <20240325020334.GA10309@hpe.com> <ZgFY24QT7470ZGnV@gmail.com>
In-Reply-To: <ZgFY24QT7470ZGnV@gmail.com>
From: Eric Hagberg <ehagberg@gmail.com>
Date: Fri, 5 Apr 2024 09:13:36 -0400
Message-ID: <CAJbxNHeqY3QevjH3=BuD=DhB0YK6ZvPDbOn_m-LOYAfY81MqhA@mail.gmail.com>
Subject: Re: [PATCH] x86/mm/ident_map: Use full gbpages in identity maps
 except on UV platform.
To: Ingo Molnar <mingo@kernel.org>
Cc: Russ Anderson <rja@hpe.com>, Steve Wahl <steve.wahl@hpe.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Pavin Joseph <me@pavinjoseph.com>, stable@vger.kernel.org, 
	Simon Horman <horms@verge.net.au>, Eric Biederman <ebiederm@xmission.com>, 
	Dave Young <dyoung@redhat.com>, Sarah Brofeldt <srhb@dbc.dk>, Dimitri Sivanich <sivanich@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 6:58=E2=80=AFAM Ingo Molnar <mingo@kernel.org> wrot=
e:
> Anyway, I've reverted this in tip:x86/urgent:
>
>   c567f2948f57 Revert "x86/mm/ident_map: Use gbpages only where full GB p=
age should be mapped."

I see that this hasn't been reverted in the longterm branches it made
it into already (6.1.x and 6.6.x, for example) - is it expected to be
reverted there as well? I'd think it should be, until this is all
sorted out.
