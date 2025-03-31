Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3929EF9CB
	for <regressions@lists.linux.dev>; Mon, 31 Mar 2025 03:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743391352; cv=none; b=p2tNnkelBRt1GmwEUqO9tCFOeLWsNEN1W5C+F1gJUulpu3AfgkaM/0jM7jXq4XgxIOYgf9UaFVEHQlXqp9xIWB1ZNEPtg9YnYH+FzpVwDHPjFYfKNgvO4xH2BNQPTlwSSbEJXr/3uhIUQpbGuBVkPHQx/gP/TXoM/qfHs0JbRIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743391352; c=relaxed/simple;
	bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oO2GWZXXxN0GIRwxY9xuuXFHgQQtTQoLlSBE1HCv2iQzCA0tpgzUdfHXcnmdq94TGJGocN3wGEHEWuuWhXJ/x1Y5o1t52/ZocQherzfjFaVsdVQ5gJOZgdCVXwClq+LpC78sPOJaz0RqNjltkaip/cGDy5t8llhRcu4bbxHUdH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEwFdcXb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEwFdcXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743391350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
	b=JEwFdcXb4BArWGTfnD66tLS2NLniPug8c+GfVlIKCyX0Pyal/Ej5qMxiy246hnHuwrifTc
	5NSJBFshaxssi3LlV4mGg66NuA3LDzdmgFAVioTdEaD04rCeXW+TG8mrevPovsJx/Cj5/7
	xVqQnvPjQNfNmQiOZX2kOH9hFrrnPLI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-_UUi8tbOOgCFl5eqTEI3ng-1; Sun, 30 Mar 2025 23:22:28 -0400
X-MC-Unique: _UUi8tbOOgCFl5eqTEI3ng-1
X-Mimecast-MFC-AGG-ID: _UUi8tbOOgCFl5eqTEI3ng_1743391348
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3d44dc8a9b4so40311385ab.3
        for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 20:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743391348; x=1743996148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJYht588chhOshnh/oM01PQlP9cicgLlbkkCnh6ie10=;
        b=mwImicD0/g3RNdBz5+IB1OedQBud3Z4ShZbJg77T61DeaQqTqjVKv45ofQ6S5LD2W+
         VuCawlfAxofFC45AkcnUvit8MRDaTya0TBfXl//G8pCPJkn3xykV2DWmgT35RjQSIASN
         WFJANBziUZ/+0zyTqsULmARg2NEB1YfZHQ4K38pHv4QCBxQR3DYmsDHL2g6zkDfTSp8k
         3SET2vwFdhswFhJrqGHPGG/TaysjyTcY7CFWbNPsv56Ia5lGty2i+X5n6EqKHyxJX7uL
         /cMY1o8h5a5xcF2woqflZobPzW1B9+qmzfLXOsz3zFu4nczhyaC6/JS0BqreGT2rgIy2
         3IGA==
X-Forwarded-Encrypted: i=1; AJvYcCXBalB+youaNrxaNcvFFiYsmGUJdL59Kptj68O0yHwx5szLtM9QEAptg6GD1XPZfottQhaJxrUw7rQmOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg51oFTFE1XEXNc/lHB+UZHTFNAMQBT06ui78UCCITdedgAdvl
	3FC/rUYye5cHFHcC81J9ZYqkaAVZsE+5FRLZBkIV32xq36nXHZ49v28TtsHl7s0JRNdkomI9yl6
	M3dD0G2Y+sGgO9utOWvp6Ce65g3JI8LiunVqOiBIwPW3qEQ3TUdN78blsUMHoL+VcwkPRZ+OgQ6
	27G734jlqHaXs5mb9yUXjdNKrZoipGadVmCts=
X-Gm-Gg: ASbGncueaV5Iq13KpjhWGz3h7pNsI2keVeSwe6G3aDxtSyrdnLxSRUb5QVGxop22XUh
	bGeFkdiDZPwGi5tIB6PmlRl2yt0S4wgB7uUl+kbJFwu8rX89T3/c8GvXCl0n7C8BUsY2VHHA8Ug
	==
X-Received: by 2002:a05:6e02:17ce:b0:3a7:820c:180a with SMTP id e9e14a558f8ab-3d5e0a093b2mr79161065ab.19.1743391347969;
        Sun, 30 Mar 2025 20:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzaH25Vzm7n70KpLV36fle/W5sj7NSSdA8hJmo754X2wtwvaPhuyZSC58LigxxsFYAU0bQlbQf86JZovKBAVI=
X-Received: by 2002:a05:6e02:17ce:b0:3a7:820c:180a with SMTP id
 e9e14a558f8ab-3d5e0a093b2mr79160885ab.19.1743391347656; Sun, 30 Mar 2025
 20:22:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Z4WFjBVHpndct7br@desktop0a> <Z5bx7ZHNcyc5fM_L@darkstar.users.ipa.redhat.com>
 <CALu+AoSSKh=5ELgQyzDrGEDm5fm2XKteH1ZC70mm89pNSSPMHw@mail.gmail.com>
 <Z-c7V2hptt9U9UCl@desktop0a> <Z+dQZozsbdls6yqJ@MiWiFi-R3L-srv> <Z-hYWc9LtBU1Yhtg@desktop0a>
In-Reply-To: <Z-hYWc9LtBU1Yhtg@desktop0a>
From: Dave Young <dyoung@redhat.com>
Date: Mon, 31 Mar 2025 11:22:50 +0800
X-Gm-Features: AQ5f1Jq_A3xmC-EmSPquFgYtTSaWdlNOr-d-et357PEEYRDXHWaZEck-6AeRlpk
Message-ID: <CALu+AoTrPZS7ukuLsCTCwKNKVd8=PUN8nXwh9BdicyV-==-W=g@mail.gmail.com>
Subject: Re: [REGRESSION] Kernel booted via kexec fails to resume from hibernation
To: Roberto Ricci <io@r-ricci.it>
Cc: Baoquan He <bhe@redhat.com>, ebiederm@xmission.com, rafael@kernel.org, pavel@ucw.cz, 
	ytcoode@gmail.com, kexec@lists.infradead.org, linux-pm@vger.kernel.org, 
	akpm@linux-foundation.org, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jYqiUaErsXJ3YiNc9kH-5QSktfBKjowHTreZaPDbGLU_1743391348
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

> With v4.9.337, kexec (via kexec_load) + hibernation works.
> With v5.4.291 it doesn't.
> I'm not sure how bisection could be done in this case.
>

Not confident, but maybe you can try latest mainline kernel see if the
below commit helps:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a2498e5c453b3d8d054d77751487cd593332f8c2

I noticed the e820 export is different for v4.9.337 and v5.4.291

Thanks
Dave

