Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D856B522C
	for <regressions@lists.linux.dev>; Tue, 23 Jan 2024 05:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705988940; cv=none; b=CIFg9e0XFwTLJ9SC0labp4vQPSimIT9swwXzRVE+8cF6gbNpQ27iD33x7fsgW47DehgGLeBcJTBbr4pAtWZ7aFju81KZf6jDxzdomVF8dLyoWBjdwe90eJTKxc58Q2EybwEXY3cwe8TRjtnXDt+z7g27oK5FpT9lhlY32Kc//tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705988940; c=relaxed/simple;
	bh=gLx3F7uRySGSTVVmcT3q6Jip2M/d1Wv4mYeuPB+hl5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ko+/3lqLpl6t+PpEpBeBNMviMrpGOlng0/gMgObGIQgyVUem66J4SAh6L7PZxvUqkADSfmZyVTB68kJknevdnUUwPYrhdJfGNytHTysBWojlbGERYjk7Vsn99G/EEIPQkvotqc3wicK0PscojVretawo9dUSpEMXz+TqyH+JVu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMlWKxQp; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMlWKxQp"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42a4516ec5dso7314611cf.3
        for <regressions@lists.linux.dev>; Mon, 22 Jan 2024 21:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705988936; x=1706593736; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JmnrA3mt9VqgxnwpT1hiIsZlc/X5kVa0LSfpaoPtx4=;
        b=UMlWKxQpLy8aR7FsAy3DMJYSmdiS+9K+W7h0HhVQi1DvrXaS1w055Q7kdz9Ta0rqvY
         eMVOVcBiWkuMq6jXWoVnVtOgLsweTKYKgH3+xnv0S388OV+O87ufi2Xy07zC0W7MrzPj
         SJvfYRHNb8GMYAXRGw55UmFPerldJwYVpsYgvOQl/Kh6LSQKPFAHBYt3h24oKCLpwn7E
         PsGsMFTS3Z8xTqXmfLXLvsZGCgXrfkdG5Z3XmlloS6KV8uQorfpRpZhgBc8dclbXnUVa
         n0cRv+T7cWw9PvDqWoR7jxucmMhoJuguBeuaBmj7W/w+SF/zW51R3MDDQaNeq4EUbtLp
         yOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705988936; x=1706593736;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JmnrA3mt9VqgxnwpT1hiIsZlc/X5kVa0LSfpaoPtx4=;
        b=MvMgJKXnfniNYyyWLbrtW4WNt64pFeBy2pt/qPl3p1ExoiFT3R26Uy6UMhE/uwCP+V
         HgiJ6tv8hj0H4rH9HJ1HJx/N8bm+KJDYZxGAzJcRrgff+5kEHRv1otSzeOOWSIyhkiRb
         MJ2qr7rhazfumfON8PHbEnp791LxOt3LsF4g1gN+W9MV78JXLhIET/UOKurZPNgbfU20
         WEDUU9XKNnk+OjxlMx76EcDEIi8Xx3NdYcor7HqaEXRljhR5C94VmXu0ha75ccLyrUWv
         AwffPe6D3LYRolERGPSquCo/kgOQXr/2CIidRkdgPu4Vy7oV/i9NpNO/wkh2oWWhQki3
         vs3A==
X-Gm-Message-State: AOJu0YxT97eQHM3BcbVDHrxubqvXnpgmlkvw86kTnkxrwryrnvjHH0+P
	iSGJQ8fejatvDIPXGIJQIStpvgNVnTTCOT7F8b4cQxFKsYHrp7dx+TaVpfZg
X-Google-Smtp-Source: AGHT+IHgjRwVcSNNzoM/9EfhwjpfNiwtOZF6z8k+TNHzp8RGfMJn6DRHN46BMPSHE+SisvbKp7JNSQ==
X-Received: by 2002:ad4:5bac:0:b0:686:8ffe:1278 with SMTP id 12-20020ad45bac000000b006868ffe1278mr455995qvq.4.1705988936564;
        Mon, 22 Jan 2024 21:48:56 -0800 (PST)
Received: from squish.no-ip.biz ([181.214.165.16])
        by smtp.gmail.com with ESMTPSA id mu6-20020a056214328600b0068602f8966esm2728921qvb.111.2024.01.22.21.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 21:48:56 -0800 (PST)
Received: by squish.no-ip.biz (Postfix, from userid 1000)
	id BF2EFAA0B8; Tue, 23 Jan 2024 00:48:54 -0500 (EST)
Date: Tue, 23 Jan 2024 00:48:54 -0500
From: Paul Thompson <set48035@gmail.com>
To: regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Subject: Re: [REGRESSION] 6.6.10+ and 6.7+ kernels lock up early in init.
Message-ID: <Za9TRtSjubbX0bVu@squish.home.loc>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

	Now I feel stupid or like Im losing it, but I went back and grepped
for the CONFIG_FILE_LOCKING in my old Configs, and it was turned on in all
but 6.6.9. So, somehow I turned that off *after I built 6.6.9? Argh. I just
built 6.6.4 with it unset and that locked up too.
	Sorry if this is just noise, though one would have hoped the failure
was less severe...

Paul

