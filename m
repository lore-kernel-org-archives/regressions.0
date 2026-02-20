Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C4E1F8AC5
	for <regressions@lists.linux.dev>; Fri, 20 Feb 2026 02:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771556133; cv=none; b=sxM9EXBwEqbWNYWFRG1TeTaSe0R4Ws4oRaIxzOd18SzIWaIyxi1BBwS8PECJmy2JrsVj6c7vX3OWy1ssSurus0DP35073PjrKrqzwQHygJmggR5JiLTYt/fF6pVbUSH7agdI2YzYRWKN1RsNo3cSXqLGOTaudmdMPZwKJl4ymDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771556133; c=relaxed/simple;
	bh=O1wlu+Egy8kX5COPwj3XJx/HFDM+oi/MNIFa11uC12I=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=afDAC7UeL5nqPuxpAOfqJ/6mxFIai3ae/ai89poQUrmwlkVtOSoGg2gnCC2EGWdzl7dlKWdDXn1CeFYc+4u0IacVDFRnl2Qxphu4wQDacGt02o0eGeb7A6vZCOArj9rbsisGML7OfDHVavTajqejP5qtzVygduS6jV7qytc2y14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOF+kfNn; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOF+kfNn"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso2458197e87.0
        for <regressions@lists.linux.dev>; Thu, 19 Feb 2026 18:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771556130; x=1772160930; darn=lists.linux.dev;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1wlu+Egy8kX5COPwj3XJx/HFDM+oi/MNIFa11uC12I=;
        b=ZOF+kfNnALRSehJlklO4trO3tzgkQ2zzzbrELOwJa5TgsX5KMh3MyIolLfnXjCKzHp
         l2d93dTgvaPMIcUpt4dqlRXGgEx2DdYpuQAX9Orl2iyQ5Fx/ZyJuVQN2BmPmtMYL4AEL
         ZQxn1btUYLj1kknnihFvrm8d82GviJvwTXcMHzuIeY9uU2ui9K8PFSh4l7mI06+wqx8a
         0w33iDKuj6XzFxe7CdQiIL58WsnAtKcX859G4ZZwZrUIsKw9zQu0unEE8vFYNyHltdno
         QujfaFB57wAkODEKCoRYnOxijnd1nyojhDbyMIqKeRozuHj1hisKD2lvsNv8AGmrG22P
         5cJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771556130; x=1772160930;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1wlu+Egy8kX5COPwj3XJx/HFDM+oi/MNIFa11uC12I=;
        b=uAIVl/VMhrowR9pg9G34cISpN0FSwxMtHnp4EYJ4Rirw84/ZeLfjZk6Kn24FLGTpRV
         Ch6NFxPq2awmSktwQIRfDN95xFcFysweX5wuEq76kWIl8n22tAbrY+HYmav1nM5q31/E
         CHeeCLQtxDzHvx69RDu+zTJSdO8gO8Jc8Q1W4DTHO6rpvgoOaLQKrDws32+YqjsAdLd9
         w9PEMpFe152zmKvVVBLstRWpndFxVqcP6Tyk05KLjJKAhdxe+nc+M7ma/A9qXEu1ODMB
         gyv1Sj8JMPcHo2GFgrc+3fgoQirfhHIWIxz6wYYsW4xPkQStYaSkSmyfyM7UxcW7vqDo
         KNVA==
X-Forwarded-Encrypted: i=1; AJvYcCUPYDAGp2+4SKYS5Jmro1ruz2wgdtGqwPeVEvYmPKRgVpKbpdkc68+Zd7c3B5R2fU/nBhld/ghaUgT/Qg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzF0VmcwnLrZCQRkHppbHbuqJY3JSSnuOTIak+7OQkAGIFSAWJk
	+03ODjUWOe3TQ12t/TVrormje1QYLihPnAVRufkRjl1REuXaFSX5oWI=
X-Gm-Gg: AZuq6aIiLagxUc0lIFO5pOD+YpA9J+dSAzXTtU43TSdk9NIl8T5ZSNEZY5hy7iZw2GE
	9XPmsOX4OjjxsXrQnuQCuI+3OPZLN4Mnkl2FDxJyFctTg0xRQSvXdr/wLQPEM4KQpp1JhGpVVxx
	3HjUEXSKLaGLBV2oVYA5Y3/PTNhZYXJsABSgJ4uE2lUYMoFNEllYiNoyuujtI6YoGmpQ6HmYb08
	sdrkaSTjqXdCKsblmCfdxO6AVfJXw0rpfTcOaqWome4Vy2J6ZhGtSY/1AcHcUnT21S0CGHiG53y
	KmCmnGZTxPq6vIl9Uk/vdWPdpbIPLOl7gHmiFlOXtBfjFc+qlMdwmYee+tJTaJ0uzuSJ9jNHXR7
	XgXMbjdKQ1pnBF9vzu9ZjeghOm80xF+btHlO1BpKKtNigOWFGTAnWpJMZcBnIYPLghMneBPgrVZ
	2tTWZHHHg=
X-Received: by 2002:a05:6512:3b9c:b0:59e:ccca:87f2 with SMTP id 2adb3069b0e04-59f6d37ec2amr6050451e87.39.1771556130186;
        Thu, 19 Feb 2026 18:55:30 -0800 (PST)
Received: from localhost ([2a0e:e6c0:20d0:4f00::1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b21f7sm5679427e87.78.2026.02.19.18.55.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 18:55:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 05:55:29 +0300
Message-Id: <DGJG8IIRDS5E.297UI3P1W2PWC@gmail.com>
From: "Ivan Sergeev" <ivan8215145640@gmail.com>
To: "Ivan Sergeev" <ivan8215145640@gmail.com>, "Mario Limonciello"
 <superm1@kernel.org>, <amd-gfx@lists.freedesktop.org>
Cc: <dri-devel@lists.freedesktop.org>, <regressions@lists.linux.dev>,
 <mwen@igalia.com>, <mario.limonciello@amd.com>, <alex.hung@amd.com>,
 <daniel.wheeler@amd.com>, <rodrigo.siqueira@amd.com>,
 <alexander.deucher@amd.com>, <harry.wentland@amd.com>,
 <sunpeng.li@amd.com>, <christian.koenig@amd.com>, <huangalex409@gmail.com>
Subject: Re: [REGRESSION] VRR not detected on a DisplayPort monitor using an
 AMD GPU
X-Mailer: aerc 0.21.0
References: <CAKx_Wg7_HBxuq5W4T_AmoFYJGQpa6TAS_Fx9SUzyy1itPmj5Bw@mail.gmail.com> <090d89a2-4f80-44ef-827c-6462d8948493@kernel.org> <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>
In-Reply-To: <DGJFVPAQJA15.378GMU7XZXLU@gmail.com>

Checked commit 7f2b5237e313, it still has the issue
