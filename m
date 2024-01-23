Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C94A38
	for <regressions@lists.linux.dev>; Tue, 23 Jan 2024 04:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705984854; cv=none; b=KwMYLbcShPLeynhRqe1LQHuCX4b0Vfx+VT1HdmFkS+HA2gsAQqdXzu/pJXiG36HE7eiPgE7eAXBfqxbk+yeZkHahU8ajX/c7lf7Eb6XcCCIATbET2N618wLl9S7Psq5jT4IT5yxLaNoB3wS1+05TsHk4i68SR3IDcHS+aXBzM2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705984854; c=relaxed/simple;
	bh=YOd0Xz8HUfT5xlx1WP8hP+JKoFmjh5aoSI7j96oW8i4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eeBdQwlbmYNgge0o3a+eTKosQNacIBh1vPRMNHezBdjWXcscILCDs9BLvtWGmTBDGckHeAqAcXeKFMfbO5zYO0hTxdcDcSrsfq6eOm+2555N2PZLeGuQM+g2sd+WhTB0JMuyBJnC5Z4f/77LxE/W+B7RHxmKqaoBDBW/RyOVrPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Li8sbvYq; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Li8sbvYq"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6860ff3951aso14673766d6.1
        for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 20:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705984851; x=1706589651; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mJL/+SwQwpiuMOYdxWq9BpZVB2GgCdaKykGe+EXHzSw=;
        b=Li8sbvYqp/Ld5/Cnzx88qNuUs0WmJEVhkOLChrZCKu+EKECYCBYDwe5KbgG8937TD+
         LWEho59f09b0TvaijK2asVMy5+yo/qFOpdsPCNzmGE1y/qZItk6sQe8xzLsMKd8ga5jK
         LG7TSk2AotoAqtgjJAtM1rPM7isWZ8RfFj0jChypNLlIhJYime6nxktKkA+9wRm6lQZn
         iSeamShtKagq9tjEB6t29mw5gPXiFU9Z0pJhyC57fJK7aWnhb/F5h8DnrgPZ6GQC//8J
         chXmaKS5IM9nui3OCqoVJRuTHU1kcun+wr5Uh7fYCk5VBQqExIYE9WPy2WpiC7CclUcz
         s4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705984851; x=1706589651;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mJL/+SwQwpiuMOYdxWq9BpZVB2GgCdaKykGe+EXHzSw=;
        b=XpmkiOULceinRFG8DAuzDXHNFeWHMLzN+Od50YkF/Dt+xjYDn0ciXuZT4aVP7PQi70
         +z/GdG0qPmIruHANj0dAWaK0OIDBg8k3mGdkcLtEVPhdwEMtBPgiDQ/6946fbEwgq0D2
         O2sFCUJP6q6W5B7M8d/VivtXJeoF5C2P6KRkgPVQ5dJRTuT2GsHPKsG/06+OZ1MynaNI
         xAMRH5rxogF/b/4BZ4ry77sGhJHGicpOtstQZvDS25YG6CBSka5hDdiu1CSe774I/ZfH
         aaWFWu+3EqvytgeZneomoGY6+uZgMvQXHmsftVdf4EIikTJDVRXgPTpi1MpOkKwgOC01
         FMQg==
X-Gm-Message-State: AOJu0Yx8LY0ZJXBDc/jlodZf5ZoMNia9t4n35JA8eW8YoGelgZzBE+JI
	NXmNHxr5VVAdHc+AaPwz2PMEkp4eA/TDLUVC0Wkk2arSlPP9Dy6ZQdOcpKQB
X-Google-Smtp-Source: AGHT+IEccH9VvezrwqXv7iLjDCw+wdz+tSaIyaTqAV2PO5Gsb/7wZJZDqCZB3+UapLVR3YEFRxkBzg==
X-Received: by 2002:a05:6214:c8b:b0:685:f795:dfc2 with SMTP id r11-20020a0562140c8b00b00685f795dfc2mr421040qvr.86.1705984851150;
        Mon, 22 Jan 2024 20:40:51 -0800 (PST)
Received: from squish.no-ip.biz ([181.214.166.113])
        by smtp.gmail.com with ESMTPSA id h4-20020a0cf8c4000000b0068189522cd3sm3048642qvo.67.2024.01.22.20.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 20:40:50 -0800 (PST)
Received: by squish.no-ip.biz (Postfix, from userid 1000)
	id 2F730AA0B8; Mon, 22 Jan 2024 23:40:49 -0500 (EST)
Date: Mon, 22 Jan 2024 23:40:49 -0500
From: Paul Thompson <set48035@gmail.com>
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Subject: [REGRESSION] 6.6.10+ and 6.7+ kernels lock up early in init.
Message-ID: <Za9DUZoJbV0PYGN2@squish.home.loc>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	Hi;

	With my longstanding configuration, kernels upto 6.6.9 work fine.
Kernels 6.6.1[0123] and 6.7.[01] all lock up in early (open-rc) init,
before even the virtual filesystems are mounted.

	The last thing visible on the console is the nfsclient service
being started and:

Call to flock failed: Funtion not implemented. (twice)

	Then the machine is unresponsive, numlock doesnt toggle the keyboard led,
and the alt-sysrq chords appear to do nothing.

	The problem is solved by changing my 6.6.9 config option:

# CONFIG_FILE_LOCKING is not set
to
CONFIG_FILE_LOCKING=y

(This option is under File Systems > Enable POSIX file locking API)

	I do not recall why I unset that, but it was working for I think the
entire 6.6 series until 6.6.10. Anyway thought I would mention it in case
anyone else hits it.

Paul

