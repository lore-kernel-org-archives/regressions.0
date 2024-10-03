Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3081AB51A
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984916; cv=none; b=pqmRQDCQSfXOjHZU/rLtv/ln/yNWTuBJYBVH4uE7im0Miu+iLRrOPzKWbvH6ygGrXy8maIEsx6nqOYk9S40aoYjZYd3IUjEQZNY6uoL0KLVaur1S1oNC6MkDASYzM7cF33oS6fD4KLgj1cy9qMQLEsP5HmmnlkqiAIDzr6ZwP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984916; c=relaxed/simple;
	bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=OHatafOVfyj7opI4pHvcpKwpBGEVW0eLxh6/pAK2dxmjfzTc9ikalXaD2fcFqzu9c/beWNpnifJ+JHN0AxI571A+UKlL9MgdbTS2a5WjH5cxtPLjNpZ5Mc0MkuujZUyhc+YyylK9k38wNC0OEgq1JzWKYUG5kvzO5ZEalAusNRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JAi8A5cO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JAi8A5cO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5389fbb28f3so1436817e87.1
        for <regressions@lists.linux.dev>; Thu, 03 Oct 2024 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727984913; x=1728589713; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
        b=JAi8A5cOjHu517YV8FebmCWmZEpIY8NXY5UZFJy24zVZ1NUd50eUFmPeKOrPdbM1d8
         NmSv8OIQUoY/MQtBy97Avwj0Lx2NDYeAGQn9dHD2Xxwqb/6nCwsD5DmhekloHFzcSIJi
         x3uvPdlyDvntTjwmytv/hxpVWLWox74jYtHIVmeXZ3y0NtC6dY5U2aarQuw7DfL3+Alm
         2MggYyZ0lR8dndUp3Yt3KNhcJdOyYbZM1P3dKm51Ai7+9JU3UR89GedfpGAhxlzeh2FX
         ICRwzX2zpCxMLkAxIoI5S6U7ff8EeF004lwHBgt32Ab+RUapnGTiuChVCMOq/Df4+t+r
         LSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727984913; x=1728589713;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
        b=rkdQEUi1QS3ykrOPJulcGyQZjTPx2Agc8QzngJn3WkMd2bx8Z+N/wh1jP/6OjW1gAa
         k2h4ObWUDa7UzPaOcu6bGs7HncS5brGmj1yZkz7Hk8bftw2Gq0/MvPG6pBEkxzaf3r4q
         /h/uh2xjo7P9SIOnW+wWq/onm/zz9+SXDirni5VxYJo8RPpUrX3+obDe+Uj9VBYzDgHE
         +PofZfBZS/tn+rQvbN2Xv4hgJ4qxyaz6VkW4Y602k0a06OPxWvHyGd227ItsljfDc/6W
         vZqarg6P/+qe/MY6m9pRi0U+i6BzQqAQjpY6jN9RhnYV+HjiYZ4Hy/Q4m3Dc1c76lRVz
         8zNw==
X-Forwarded-Encrypted: i=1; AJvYcCWdgYSCZs5D1d8H0fSzb4REWmVYQqaBaUlLP6+LEPCr6vhHGZSKhMGgtz5wR6OWP8PFzjm5pOSoZd9+fg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzpZr/IZOlqcQNL6QOMb1+cRIKb6bQ62cqYXIVRFoq1IXgnpv6A
	sTccHGhPMUnO65b0a7ZS/NxVnfICwI/y+bn7LsHKoKc2WatnZVm6
X-Google-Smtp-Source: AGHT+IER6XzFJ/9D6ZSmLIQW7xzVDqoYQ3Z32Obikwwjp3rt/WrJ1RiMeuc9PABCSCfcJV2QtbG43w==
X-Received: by 2002:a05:6512:1048:b0:52f:30d:526c with SMTP id 2adb3069b0e04-539ac12cd74mr97194e87.5.1727984913071;
        Thu, 03 Oct 2024 12:48:33 -0700 (PDT)
Received: from foxbook (bfk18.neoplus.adsl.tpnet.pl. [83.28.48.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8251106sm247634e87.4.2024.10.03.12.48.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Oct 2024 12:48:31 -0700 (PDT)
Date: Thu, 3 Oct 2024 21:48:27 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: harry.wentland@amd.com
Cc: Raju.Rangoju@amd.com, Sanath.S@amd.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003214827.4edb8731@foxbook>
In-Reply-To: <467722db-188f-4487-a837-01e65e194d3b@amd.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> It hangs after some messages.
What are those messages?

> I sprinkled printks but don't see any on the console.
Did you use loglevel=3 on the kernel command line? No surprise then,
unless you turn all messages you care about into 'printk(KERN_ERR ...)'
or 'dev_err(...)'.

I would also recommend increasing loglevel to 4 (permanently), because
KERN_WARN is rare and usually tells you about pathological conditions.
The 'quiet' option is an alias for that and used to be a quite popular
default in distributions.

Regards,
Michal
