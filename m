Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C3F2566E9
	for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758140711; cv=none; b=FyBcIldvsqAjybI/7//fStFnUEcjb0PqNscQ+6l/ikMs1sVyCx7SWlrxVb1KcgwwEYd8OcOmf0ZVr8dNn24+cRUZIoVEpAIexZH32Ee5a7Fxw/iM+XrSRJW8DeulFV+b1zcw9OTnxR8Y2knC+USfHi4MVDq9VaZmgUzPOKn7NuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758140711; c=relaxed/simple;
	bh=7dc/T3NiAPYzmFFFppCpGvV8e6oL7rv+p6bbY4Wwh64=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gV15xUAFtRPxqPhYmR9bTQ3EjnszwMYrrOaxx2DmwSyA2+SFlWsLR0765FdCPc08+FxoHKqQ/C1YFbHs5NgEObHLP9L/qvN3QsUrxFMy0Lv6/r75YHg0RRcHw1R1cW9UFu3c3EArvKzPMNb7rNc7SiJwyszn7kSBq7bewMiyIP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WO++QuuV; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WO++QuuV"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-74595f3852cso222566a34.0
        for <regressions@lists.linux.dev>; Wed, 17 Sep 2025 13:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758140709; x=1758745509; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7dc/T3NiAPYzmFFFppCpGvV8e6oL7rv+p6bbY4Wwh64=;
        b=WO++QuuVu5sRZiaXTP7+ikpbGTa3tROgL8NbHtVlWMtvc5MaC2sv5Sx1gUugcWJfhF
         esxlKUVxTDEnbqhnBzIRq2l+rWH3NyzGjJrcE2w/0qKXI4NbDyVwMXVJaghlXo6w6/Ky
         3aG5H8fgQGdaVwLHsq0CMuQf4BfKlVk7HWeFgyw3LVNiaPzjEsZEIy3+2JvHCgXmOLzA
         w3Czi5aJMxi3EN4a0iAz/3q58eDJtCCdUcwd5uVM4G1PSu2nAZBdHwJzqFQ0diZPSfUn
         CU5mJPUP8ZT0glOg9sKHo9YIE6gqJbWqFVBK3iuH6nNf0J/SqgBve2CF/bfZt6ZXRP/9
         /UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758140709; x=1758745509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dc/T3NiAPYzmFFFppCpGvV8e6oL7rv+p6bbY4Wwh64=;
        b=N8E6NdAEtnUJ+kRsJHAimYpk8GF1dewbzJhRq4ozRiEw3YiEg/lIGFbB/3WYSQfSWU
         Z1jVi7vVQh04IMUajW6fXwBbzolwtQnh+sDUcOA3Chwuq9ByPrVjUFIOZDaMUxkJrX8+
         AdlTKYKbhvRmBQdUh5RolsMk9QtsMBu1c6PNnlzWnB6osCoM9ora/JJKQoGjBEV5n3vf
         9WjItHqPw2vzyCuhmoWoOibG9mKipG3it+Ti10EDxj+DuJGEvzexqxV7WQEHmY027n/n
         C0Xwn++Dd3eI2/H9MB9sCNxGKG9DEQ8Do4tBqzS1XnQ8PLqM5ieAWIEbqUFsMuUqeUsR
         Ob/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUudv5HQhE9t5ERAFxyvihZYDeg0rSDQe1lfGP2hA3CxJko0kdrSgI0vlSN5Jk7hkPjM3ynZydNRtaoRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzyagb4LQWxLXnsQ6kquMkv7H0/dBqcQ0CT+tSG/q2mIPcJQgpD
	SzBThYo79f5jHpdjWl7h8lux8UX4BKJG0+RA6n4FNjm2Zyea/4cF0LbY
X-Gm-Gg: ASbGnct6X4qzS3MVm0w17cW8GG6UoLey3oY7n8BcsTgQjhHfab5VX52bFlREnDFbWqp
	azXTTMCN6UR2N9UMS7ypmWFWby/0aI7s83+EQqbOSzMt36SCigBUYwO+CT2PrzEoa2PuKvHEb28
	Oi0dpk9HN1L8xpnzqy+7rqdWPBe+n7PfASSz5vUQw/XddZCF5fl3HCVytLb9cVfcGjAgbmE4PQy
	D0mABuIPqpi7eqyxffHN5dSFcq9hqKOZgJo2y2fzmcoZdsHiDqFuKNlFO2CDJoGHPu8chE//KHV
	McgLJQo4PJxoDwrKgFVHIv+nG4L0zd8MPaUypLWXEJhPrLA+hxfzQL2EzB9ZrRM+ovtJiUCn0c/
	gDAp2dBBt04/urJpo/QDdlbv+c6NfCSilgj5KDWdC4OcbgYur07I75i6NJnu6jCAmTTyHP+CIcN
	4VEn1uIvuvPCQiIpREaY1oYF2Bk1yzrXgXEqOyBC1iefPx4rflAjWZdw==
X-Google-Smtp-Source: AGHT+IGhOKVNgPbUMi5QcAEGdZZUFZp3baLhtVrdFIanYhMPSKuTqGIV0Rw8Y8CUPJ7y9QLOU5wEkQ==
X-Received: by 2002:a05:6808:4f62:b0:43d:20c9:9783 with SMTP id 5614622812f47-43d50d83b3amr1772003b6e.40.1758140709345;
        Wed, 17 Sep 2025 13:25:09 -0700 (PDT)
Received: from [10.0.11.20] (57-132-132-155.dyn.grandenetworks.net. [57.132.132.155])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c6c7532sm101903b6e.12.2025.09.17.13.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:25:08 -0700 (PDT)
Message-ID: <caa08e5b15bc35b9f3c24f679c62ded1e8e58925.camel@gmail.com>
Subject: Re: [REGRESSION] af_unix: Introduce SO_PASSRIGHTS - break OpenGL
From: brian.scott.sampson@gmail.com
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: christian@heusel.eu, davem@davemloft.net, difrost.kernel@gmail.com, 
	dnaim@cachyos.org, edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	kuni1840@gmail.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com, 	netdev@vger.kernel.org, pabeni@redhat.com,
 regressions@lists.linux.dev
Date: Wed, 17 Sep 2025 15:25:07 -0500
In-Reply-To: <20250917184307.999737-1-kuniyu@google.com>
References: <d994dd8855c3977190b23acbe643c536deb3af71.camel@gmail.com>
		 <20250917184307.999737-1-kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

> Thanks for testing the painful scenario.
>=20
> Could you apply this on top of the previous diff and give it
> another shot ?
>=20
> I think the application hit a race similar to one in 43fb2b30eea7.
Just tested again with latest mainline, but no change. Once suspended,
keyboard becomes inactive and no longer accepts any input, so no way to
switch to tty to view dmesg. The only way to move forward after
suspending is holding down power to hard shutdown, then power back on.
I tried enabling persistence in the systemd journal, then checking
journalctl -k -b -1, but nothing is recorded from dmesg after the
suspend.=20



--=20
 Brian Sampson <brian.scott.sampson@gmail.com>
