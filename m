Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A1F18C91F
	for <regressions@lists.linux.dev>; Fri, 25 Apr 2025 16:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597314; cv=none; b=P5u2fPWV4kjsl4YcCzJQ6FAqChMZQHmb56M3d1kMKBznWrbrKD3VJ9HM2FbnXfqUqcJK4uArKpMQKf7ObMus2E9QKGtKZUhj/si2DWu9cmMLgxZs5hB9oxyqrDZwBTsrZr87G0YgJ6WjrN0z1x5YQ8YeE3tPschQtsuCPjvPAH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597314; c=relaxed/simple;
	bh=L2GzxIA56nfM+cDgMgMMSOWe5dN+/yidKvdmYvhSKfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QU/DvNZJmGfkwMDG1mxQN753pNH0TWia6/ldFdgOwFoujIVf4eVZMKTpu0xbfB41mKACc89ZTPRQELdHUF0/ePIW8yYoQDdsyyMV4qDgP/Dk8oqVZwdJavVslLP9Yp42VNVdX3G7j7ryRJ8zd0QTI63YhH3oEmY8W6GB0paCPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1vY28YT; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1vY28YT"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227b828de00so26565585ad.1
        for <regressions@lists.linux.dev>; Fri, 25 Apr 2025 09:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745597312; x=1746202112; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i5pNyASVzOvo7de5opodmAAp0f24p09fWkyNMVBg/4c=;
        b=B1vY28YTxUyKl336jL5zmuTmiyW6yRhnLCkCVU1m/lhSCjpWKSOb5aO+wt6b5r6qy6
         piBXVWu5q8Z6oGq+yJ3Hhlff3dXL6qc5834wc2J9xGtil7t6IGU6BgjIgNBJ8vHtzX0q
         c0abQJzjGMgHs0bOTO+W0Gaoyzehr3v1BiQBf39J302eznJ/xiLkwaprQlQZzDOaW0+L
         89xb4G3d56i8BsWvfpuvpPtMGnRvCB4cxPIZbTr9wkOlIgdLWtd7D+TZYU9oiynkZffK
         cgFp2zC/kzOsaYdxkcFWcgnkVawjbdxQlGgYeJxMtxxg3fiRO/N4OF33dkZmPjedG3ik
         lR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597312; x=1746202112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i5pNyASVzOvo7de5opodmAAp0f24p09fWkyNMVBg/4c=;
        b=WI7SF+TOcEE7XbW4u2UWkblvC6/q7hkIB/hRGqHQci+UtS/vcn58e+7CMwVLh813t/
         xtIzAtggcr0/BkxcqkiLwVsd8/FaTWL59dgJsceR12E6h3EqrUIBpBowdp+UvB6KznU5
         DP1pkOftzK7uh2W1LYPuI3Fq2epk2a+/sUklO+b73/BjSL3HoBgKib42/ElBI5aPpnTO
         +0WyGafi2EsL0e0LD3C5exdSDTXmF/i8EF9oTxxCprhmvhqOgs00p6EWfIoIdpgrEjF3
         WpS6zRtnaVAPswt85BicDGfI8EQFDans6ZBbbClQZIq0bOPAYr2WaIFCwkAQ6AYp7uYi
         rESw==
X-Forwarded-Encrypted: i=1; AJvYcCVD4Ps72L0JQrHqAgsQanEj444HrvBkRKvmfA262jWwpOTuv3jzZGEprYKYSPJNEVaPq5fQAQeVDL3PmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxAbiXLQvDAlINjTGVNENRx9SbT/1u3MnpLuI2IKt3APEXxvLbR
	IaJ/M9ndoWYj/Zegh1hmmvdJjlxrWyr03qNhH212U0waZNa+FNlN
X-Gm-Gg: ASbGnct0dt85WxSIgg5QIzxlhgri8FUNKTqsJPL3woNp2BacFvy/LVNnI208pjVAfJQ
	WQz5lAgc8cMBgSjlDo72BhYYQjAXlp5v2SnQwTydU1ST+rdlEOtxeRbTQxmFTk55Br5lwN+7jn+
	uoCXjwFPrkfAFoGe6IvIFwIr/bnrZzZjzhF25y8dOInkibRicY5VLauLGLJzJQttGtF73gStMz5
	XobSOEtIkq23Q7LQw+q1Fcf3R412Q7E7f7Or+UdDIUBhSyadyCWefDEKrGu8y1ORe2bY4hZl+Kr
	zmaW7jK5oOAjDKeHaex/JF3hF0sIlDjVMdkz6qpyWHrWTDE=
X-Google-Smtp-Source: AGHT+IEDnCojjqBFupUvzzEwiunkDr1ppd44q2OkPVWtrj2YUpLPC11441r/ohtaDxUPakVfJZSnow==
X-Received: by 2002:a17:902:f683:b0:223:62f5:fd44 with SMTP id d9443c01a7336-22dbf62c38emr46955105ad.40.1745597311720;
        Fri, 25 Apr 2025 09:08:31 -0700 (PDT)
Received: from localhost ([2601:647:6881:9060:e00f:8820:97a7:c371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e7b08sm34009365ad.114.2025.04.25.09.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:08:30 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:08:29 -0700
From: Cong Wang <xiyou.wangcong@gmail.com>
To: "Alan J. Wylie" <alan@wylie.me.uk>
Cc: Holger =?iso-8859-1?Q?Hoffst=E4tte?= <holger@applied-asynchrony.com>,
	Jamal Hadi Salim <jhs@mojatatu.com>, regressions@lists.linux.dev,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, Octavian Purdila <tavip@google.com>,
	Toke =?iso-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@redhat.com>,
	stable@vger.kernel.org, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] 6.14.3 panic - kernel NULL pointer dereference in
 htb_dequeue
Message-ID: <aAuzfQe08tFJclNJ@pop-os.localdomain>
References: <89301960-1758-5b2e-6d91-81ef06843e14@applied-asynchrony.com>
 <20250421210927.50d6a355@frodo.int.wylie.me.uk>
 <20250422175145.1cb0bd98@frodo.int.wylie.me.uk>
 <4e2a6522-d455-f0ce-c77d-b430c3047d7c@applied-asynchrony.com>
 <aAf/K7F9TmCJIT+N@pop-os.localdomain>
 <20250422214716.5e181523@frodo.int.wylie.me.uk>
 <aAgO59L0ccXl6kUs@pop-os.localdomain>
 <20250423105131.7ab46a47@frodo.int.wylie.me.uk>
 <aAlAakEUu4XSEdXF@pop-os.localdomain>
 <20250424135331.02511131@frodo.int.wylie.me.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424135331.02511131@frodo.int.wylie.me.uk>

On Thu, Apr 24, 2025 at 01:53:31PM +0100, Alan J. Wylie wrote:
> > On Tue, Apr 22, 2025 at 07:20:24PM +0200, Holger Hoffstätte wrote:
> 
> > Meanwhile, if you could provide a reliable (and ideally minimum)
> > reproducer, it would help me a lot to debug.
> 
> I've found a reproducer. Below is a stripped down version of the shell script
> that I posted in my initial report.
> 
> Running this in a 1 second loop is enough to cause the panic very quickly.
> 
> It seems a bit of network traffic is needed, too.

Excellent! Now I can try it on my side instead of bothering you. :)

I will check if applying all patches here could make crash and warning
go away. And of course, I need to really understand why the crash still
happened even after the qlen check adding to htb_qlen_notify(), which is
unexpected to me.

Thanks a lot!
