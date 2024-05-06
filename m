Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B828E145342
	for <regressions@lists.linux.dev>; Mon,  6 May 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714998275; cv=none; b=guEtB30d1Nzyozg4B/fQ7Rb4rONrpjDQ5WnwLnKUf3UoCDaC3Dm5fOkSUfT0T7Y18G6lbZWc5NfdsbQqHb/BBxhJOwIu0kkokYbbF6oegiYDktVJqnJsphyVnwavwD/ZwhByApvNkt1dVFc41feEzQkSdNb6iVTObLWrBm6qfb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714998275; c=relaxed/simple;
	bh=VCwefnSO1mWP3wvCYO8NG8cmLf3dw5blRuYik9s4/vo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TFBlr8exwDGFL+sPbkHAwC/xa16IWES7+DDs7rSKZ1iund9Gp0Mfvupwldd5MPtn53LOpYkLYEueVMeNyGY7TyG1DmYwtRj387shDKVNlzg5DoJ8ihtkLLWJl5vRMHiNj6kHFgfvt5NeSmga10X+eCHD+EI5+x6C1/CFZL1+vUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeNIHLwQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeNIHLwQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-5d8b519e438so1501607a12.1
        for <regressions@lists.linux.dev>; Mon, 06 May 2024 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714998273; x=1715603073; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VCwefnSO1mWP3wvCYO8NG8cmLf3dw5blRuYik9s4/vo=;
        b=KeNIHLwQC7dT6fyZvGRQ7KO5HT5FoSZXvkt8PmqmK7JLCvt7VA+UM184JEdo12QCYg
         /z7OvycRXvaI/j0Dk6YGxMUmM/4Ad5zFa75/+jUUsfdMashrW9OasiwEB0VDDFuJrYXA
         B3qEAPT2Dap7DgVMvN72QAuDFZmQIc3EHMAA/ZJAvED7+nDmXxeveeybRIPbywrAfxuU
         XggfGEMEnMfeGJuGWAfLgBOQFH6NDqunC55s2cSsheS9wyZ8dU+XuUWGBYpyfM7733BX
         UTgCZqidR8OIW0ZD8mRfwuOq3sj+YoBtm4FdI/iKT81BVWpHVwd+2VXrydTXa5CK8v5v
         thQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714998273; x=1715603073;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCwefnSO1mWP3wvCYO8NG8cmLf3dw5blRuYik9s4/vo=;
        b=U1SKY7qwZDPBQfLKTm1Nofs4JT4Li1vX8nU07i103DGx4hF5ZZBmhw7PhhZnw/qcZW
         /C3FAwZrjn+450L3Bxa3SYfMQ/cnJ4L7JhwRvTFkVAG92wX5Ksgo4+b/DxKEXjO1GWcB
         WiQ+zHZ49RyykyoRVr29x9alF8vU2KZNyHyO55vuUS7LWL9qmuWp/EogUNIV+E45n+Py
         iyqtogojtSQMQ6QpTqU4GMikGo2hORxfciT93x9goEgrSrGFp+ltP8baq+y4U3Z+oJ9s
         QxOdgJzeWOvlzyJCpCXA0LOtjDJUB5xAhPGnQQ+2W0ksCrz0n1PwqyC0bN4BnQXLL0iJ
         n5JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV//IMHiG2S/djIU8zntEN+7+HRHufb/T/DhyvWsHBpZR9kbc8KHTK5q9FAbxV+5FbKrI6Vw9LEIyNHaBjyHHF7MPAoWTn/v0Pt/Ms=
X-Gm-Message-State: AOJu0Yw3yuLLxo608mZIHKXvr0h2ZOcTrMhYMDeR1alJIe2s2codmRxl
	XfXmmWdgNjBdnqr5uYzzkpOfbf0zYwIzBJsMrcRuOR/1zI6Dg5WGBnNpGtCU31xsSmy+aVqGzy3
	d6bnbrO51cmOb/4zU9TTf04yDeos=
X-Google-Smtp-Source: AGHT+IEd/lQadz6HLodst0XvIwwJpRK21g8fJQpVh96YyjFG/ZaiqKRyYGWz1PmiCH/1XNfAfQk+VMJoNuOkf0SQSxw=
X-Received: by 2002:a05:6a20:9c8d:b0:1af:8ca1:8fec with SMTP id
 mj13-20020a056a209c8d00b001af8ca18fecmr6721824pzb.16.1714998272828; Mon, 06
 May 2024 05:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Gia <giacomo.gio@gmail.com>
Date: Mon, 6 May 2024 14:24:21 +0200
Message-ID: <CAHe5sWavQcUTg2zTYaryRsMywSBgBgETG=R1jRexg4qDqwCfdw@mail.gmail.com>
Subject: Re: [REGRESSION] Thunderbolt Host Reset Change Causes eGPU
 Disconnection from 6.8.7=>6.8.8
To: kernel@micha.zone
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello, from 6.8.7=>6.8.8 I run into a similar problem with my Caldigit
TS3 Plus Thunderbolt 3 dock.

After the update I see this message on boot "xHCI host controller not
responding, assume dead" and the dock is not working anymore. Kernel
6.8.7 works great.
