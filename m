Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BCD14A62B
	for <regressions@lists.linux.dev>; Fri,  4 Jul 2025 04:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751605036; cv=none; b=Fzhc0j0sQ+wjcZ7y2ZLnlk3g9V/bnTA1eo3jTtAHBs0/CTnZbcW7JrUsi2/AEHYLYkF81SIst8l1N7gSg1lnRTmO07ZCEfcjgolsx6z11q8rElcEPq3Axa0WGTJ043+Ki3tUYeeIxXgnXULGJxoAnDDOcK5QVkI0ss6DI3gUoJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751605036; c=relaxed/simple;
	bh=FDw4ZPy3X7k/Beth3BEz0O00Bzcr7Wah6dBowmHyKVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CGngEY1k7dd9NodJKvu0Bet7MvEZRp+cR9aMku1j7XOWAx2crkksg0ubMiiQhVxXuDjFSCD5oz208p7Z5646idHXT2LwcC+0Ul/wTDBN/chuaiXxxk94QFDpWOkqOVjx/U4wAv3trqPCJgyaFNzirQyTkDaHn9lJ25wJ1mzF09c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GOhBLQMw; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GOhBLQMw"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-23c703c471dso15429035ad.0
        for <regressions@lists.linux.dev>; Thu, 03 Jul 2025 21:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751605034; x=1752209834; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FDw4ZPy3X7k/Beth3BEz0O00Bzcr7Wah6dBowmHyKVo=;
        b=GOhBLQMwC5TX6AHAGwSVbU2UNCVwdY5ygTKiniiqA813aWQqnJqflHl7AUrbr8xnyk
         CfAdzaycGiL7cHZWAdtIWmlidXUmhrn+aSisgt3IcGo8OGKEnAAp0OX6kAdp0qBLq03d
         c0Vj7JLvxXsMXwvfWbKyPu5yUZhqlmNsKXydw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751605034; x=1752209834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDw4ZPy3X7k/Beth3BEz0O00Bzcr7Wah6dBowmHyKVo=;
        b=cMGX7KMviThzNoKgW0ShO4XKo87XqP8AL0ywDfJyn9uKVMBVhoW9/qgIe8lNn+4286
         sgPkM3jx94K0R1nhOqm/UBjaOVRqB1cV26OoGukwu1koIf8aVHl/eyim1dMNWbpMYfCb
         71QsgMq5WguSiZ+K/cXahPJ6VJbclIY03de4JZ3/bHZBhUv8Z0l/i/u8m4NvN7zgdlHt
         HXW4Hzddy2PqyrPpBXXjJQ5nPQOHgmdpZp2Xlc55zCOCbdSYBd3qRhJRhKNHPMOVzbCh
         RR0HL2YTUCtCK/PgS9rF97kQC6cXeZmk5W4y/rB/WtEK2IxP9KuCuQhgnP25RtSC8mFO
         iK5A==
X-Forwarded-Encrypted: i=1; AJvYcCXTDdzhPf6mfeU3a3Sf/DvNnipqhlMsIXA2vZy8qbPLFRh0EaQPeT5nCz3ie4aSD+dqhn5114PBC1pjFQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgmzkVhMtZIG0rp1+v/yB8pXfZ1wh27s4tN7+FEryh0jfWJnLe
	OpVVIEMnpGKmG9iltv43mbcnrHqNkQ/qNjAyfMmGGayGCA1NRSI9tSpWckGK1ueHfnW4XSdgj30
	dshcnksMD
X-Gm-Gg: ASbGnctSe6DuZ6sWp2Nov+1i41F4IeNFwk6Ty4kJK1thQzkS1Kd/BEDKJT/zvNUT4I0
	56ucO7j2V29ORVnC6tskShUnJuKzgo65C/XR3OuduXrZuPupEFjM6gXj5Pftx5dF/FuXGp+VRd6
	9SgFsItmu8u8TlnLGHN6Zz33/HCNNDVEkVtK20KfffqZrTyR0LGSnVvmPOQHyqI2pD9eq26OfQd
	frWXhMvba0yjTjqs/KPmVPAjtTQgr00QQGMftrqJznKKA/7dhO8ioYHxp7MPkIZFLw8s9766Zra
	+BYM4wkdJ17217xb4o0oQb2O1cHUrbsPfrLt6qlFv4dm+L9684PCCyZJNR+TaFY+lV4EtrzUt3f
	dUBHT2uiy8CmZyUclJLtADGmoYRh3Ffk=
X-Google-Smtp-Source: AGHT+IFCiTCyMbOoG1CIaW+maiPoZ0qN70TwIPuNZafNx1cfuiEkUVFJ99CE6VPRt7oyS4zXNCBpFA==
X-Received: by 2002:a17:902:f70a:b0:236:10b1:50cb with SMTP id d9443c01a7336-23c8598a1d3mr20437325ad.26.1751605033961;
        Thu, 03 Jul 2025 21:57:13 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459a17bsm10593005ad.214.2025.07.03.21.57.13
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 21:57:13 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2357c61cda7so249045ad.1
        for <regressions@lists.linux.dev>; Thu, 03 Jul 2025 21:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlfk9T7sJGTNwsOlB4kLGPzFEBPdpsb4iynCnfbeFulKQZs4fUQRHCdJvZt/0Y9BSQr3LoEn3NL4NWnA==@lists.linux.dev
X-Received: by 2002:a17:902:c405:b0:237:ef9c:ffd9 with SMTP id
 d9443c01a7336-23c79adac6dmr4437795ad.2.1751605032342; Thu, 03 Jul 2025
 21:57:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87C1B2AF-D430-4568-B620-14B941A8ABA4@linux.dev> <84dfa466-d201-4a51-8794-6c64568bec95@kernel.org>
In-Reply-To: <84dfa466-d201-4a51-8794-6c64568bec95@kernel.org>
From: Peter Marheine <pmarheine@chromium.org>
Date: Fri, 4 Jul 2025 14:56:59 +1000
X-Gmail-Original-Message-ID: <CAG_X_pC0jTe5fuNaK81veif-p9JeJyYpgb2E2R_RXBzfcj4_MQ@mail.gmail.com>
X-Gm-Features: Ac12FXyWqCjWEIleUBl_ePtV786t5G-mg7Cm4JbPyPJYEHruTXbvG1LIQIHiEZg
Message-ID: <CAG_X_pC0jTe5fuNaK81veif-p9JeJyYpgb2E2R_RXBzfcj4_MQ@mail.gmail.com>
Subject: Re: [REGRESSION] - Multiple userspace implementations of battery
 estimate broken after "ACPI: battery: negate current when discharging"
To: Hans de Goede <hansg@kernel.org>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>, pmarheine@chromium.org, 
	Sebastian Reichel <sre@kernel.org>, regressions@lists.linux.dev, stable@vger.kernel.org, 
	rafael.j.wysocki@intel.com, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'm not surprised that there exist a number of userspace programs that
assume the buggy ACPI battery behavior is the only one, but this does
leave us in the previous situation where there's a clear bug in the
ACPI driver.

> But, the patch was actually doing the right thing, according to:
>
> Documentation/ABI/testing/sysfs-class-power

This is the key issue, since it's entirely plausible for a program
assuming non-negative battery current to run on a non-ACPI platform
and misbehave in the same way. If we're not going to fix the ACPI
driver to behave as specified for the kernel ABI, then the ABI needs
to be redefined to reflect the actual behavior. It's either that or we
give userspace an opportunity to fix itself (and I'm not sure exactly
how that would be done such that the clients which need to be fixed
discover that they need to be) and correct the driver's behavior
later.
