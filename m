Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BFC1AF0A6
	for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539138; cv=none; b=n3WCNWSND0bZlwttVEFTeDhQJPkWP6W4idbErgCQ71ZucHAeMeEI6fC945JV7YhnLTRFkZWlk5/LygZLKqGcXVrHdRaGuFchhCTqAWuSIj9eckQSKLobXpGv1CxrEXAs+QV1rQRxLmke7zyNFVRiv5dTh2eN69lHi7J+gwyyN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539138; c=relaxed/simple;
	bh=PbZtck3Ww9NI3Jmz6UqmAMFTQrT+vXacf5H/xpbXfng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma6mt5Zw/iJq4GhNA9f1N+pfUtRnQcKuKZkorwl9Q9X8IQtt4tqEv1hTxx3ZwBy09CCb1JBLAymoH0+NcsTPxQ17MMoPn3hMNOK92DknoBRKzJr02/QiqQxgGK9//jVrbPKgWphfEVT8+FjP+1/0vW9aN2T03fjS4dXA+qZuqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BNW6GM1y; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BNW6GM1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737539136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yyCjRrkbGde3kvq5V4txWDKrLIctP6FAvSzHNKivVTM=;
	b=BNW6GM1ypiUQ3ggy1OfTq9uFhMjC1J22ro+64agm0x6qhjTlr4L3D+iEPH7djogJyagTws
	N/duy6K2aGZKHkpzP361qVf3ptlJycfn48lq3Glun+eEAX0swUlg0+RbTxGhd5ooHZ76DE
	ApDXiNTDPUUsQoS9p6Dwi8WHAcr7Tx8=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-5kvbhq2aNu6ggEORIWvsoQ-1; Wed, 22 Jan 2025 04:45:34 -0500
X-MC-Unique: 5kvbhq2aNu6ggEORIWvsoQ-1
X-Mimecast-MFC-AGG-ID: 5kvbhq2aNu6ggEORIWvsoQ
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ce6817ccd8so45706655ab.3
        for <regressions@lists.linux.dev>; Wed, 22 Jan 2025 01:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539134; x=1738143934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyCjRrkbGde3kvq5V4txWDKrLIctP6FAvSzHNKivVTM=;
        b=w4MOzGwfqbw6gRBiCXR9Kj4cGVjgfJkrPx/41pTROhwyLHarYVUshPwJxN4SelUerV
         CP+4cpXo6GqmV1BPFlRXFmDJbaGZzQVr+wUYcJPUPmF+qoYEnIQOYSAyUJUn8R7nheNJ
         mlC1WcEhV+B65BIZ+qulcFD2mv0sd82Z8ey8x5ItUONOy+i96LgymbUWuUJFRb7vPG7z
         dwAETLW6q0MOrsTEOvQQHBSYW0ub9gy3Tq1eFTbxuYiF0BpT+RMAUFo9al46DYbWQyP3
         Y61kJRv1RwGY6ajNZ3RYMtks4QI2wD+qCU4dIu5RvZxaAW+JHYAybPK2vAl9TA7YFjd4
         Sclg==
X-Forwarded-Encrypted: i=1; AJvYcCXtNvpoBzCgD9LQTiIn01Q8ZT2A4oYMglt7XxsW5xhMqH8R7XhVxr67kLKJCzehSVnGqKExO54ciKHfEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzMysZdyEzRHLN16uQ5xkyO0qWXXP35UUkF9niVVQl0Mgb+H0d
	DcQe31/fsQHqSP+IYISklkzrfJDyG715HVQ62fLL1eZrlESGsK1abu1DK+J0pTZ53COytWGeeSB
	zl+mtzcNBnpIcnmwBCqs+FbVRzPs4dB7RWHFE2h1iuNHL/7mk4BeCihtb85XR9oTnwSBlty+MNI
	2kz4TI7mCs8PRzVRTrj42Z35Vek3AG+YB7/yw=
X-Gm-Gg: ASbGncvgKU/jaqQxOjvCFPk0Ui33d11qFR2EYXpOfGnCmshmudyM1msqR9eXznZZWHG
	M4kDb5ArZYWUnws74aoEi8gUC7TTeKUfLoyjmwBZTRXYUldpEf8EI
X-Received: by 2002:a05:6e02:4708:b0:3cf:b62a:d38b with SMTP id e9e14a558f8ab-3cfb62ad548mr6839345ab.12.1737539133970;
        Wed, 22 Jan 2025 01:45:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIPD077b4G8AkO2RvsoOP8ZsRfpujjR36pn01SrQFGxp7KGByKkBoan7/VXdsRXY43BKX2FEh2Wdm8Pbn+dpI=
X-Received: by 2002:a05:6e02:4708:b0:3cf:b62a:d38b with SMTP id
 e9e14a558f8ab-3cfb62ad548mr6839035ab.12.1737539133320; Wed, 22 Jan 2025
 01:45:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z4WFjBVHpndct7br@desktop0a>
In-Reply-To: <Z4WFjBVHpndct7br@desktop0a>
From: RuiRui Yang <ruyang@redhat.com>
Date: Wed, 22 Jan 2025 17:45:41 +0800
X-Gm-Features: AbW1kvYNw_qRoZSbVWcaArR-_IblaJucJ-H4UePBgio9Q2kKLmrwRXL4Nk8Joco
Message-ID: <CALu+AoQhCjUPr2dnYdN751dyUgNUpyx1HCfyztF5GaP3QRzibQ@mail.gmail.com>
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from hibernation
To: io@r-ricci.it
Cc: ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz, ytcoode@gmail.com, 
	kexec@lists.infradead.org, linux-pm@vger.kernel.org, 
	akpm@linux-foundation.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2X7EnY7xuB5kPt_9BFVu5GlrF8tCxVeEL3RDF_oZeDM_1737539134
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> I can reproduce this with kernel 6.13-rc7 in a qemu x86_64 virtual machine
> running Void Linux, with the following commands:
>
> ```
> # kexec -l /boot/vmlinuz-6.13.0-rc7 --initrd=/boot/initramfs-6.13.0-rc7 --reuse-cmdline
> # reboot
> # printf reboot >/sys/power/disk
> # printf disk >/sys/power/state
> ```

Which kexec-tools version have you used?  I'm just asking to see which
syscall is used for loading the new kernel.   From your bisect results
it seems kexec_file_load, but just a double check as kexec_load and
kexec_file_load use different sources for building the e820 table.

Thanks
Dave

