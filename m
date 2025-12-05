Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CE321CC55
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 02:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764901004; cv=none; b=o9RsVqrT6YuJcxcsLeCBQ5fjz1+C2xEkWNY1elMcbIbq/jWBPsmXG29H5MjXpPv+QwTlQEpS6jQNjlYJ9PIpdENcXfj1yLIhfWYF14+xbW/AjXAGocfMCTve4HDGj0/vdbnsW86aRxr5JUFIcEkaw32ikRRb/+deIPREWstt0k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764901004; c=relaxed/simple;
	bh=XN2xK0L6T8z2gUvj7EKa9rykXv4aaY2b2j4P32dthxc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z01itky3OO4hpmRV2ZV6v7dd7g4Ld8oQan4qJWJfrKBiQSPwqdLvTawzK1+szl+3Iy+6oXiuV8OB2o8Z5EogmcFKOOptgRx/8tj9K/opjWyj98NI1kaKEezS8hqh5tX3lcvo983ZLHoWaXfHQIAG7hGzqZzIIzysDK8VYbDUPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHIlyKFy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHIlyKFy"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59581e32163so1933746e87.1
        for <regressions@lists.linux.dev>; Thu, 04 Dec 2025 18:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764901001; x=1765505801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=BHIlyKFyKQMuXOYIuI4/TbvxQIz0PitJHSJTZcFkWdtpj6yHn/ZUG7okhC45q7j6pu
         SAJS2lQiFkQtClCYEuCXrvDdJj+4HuaVaZFZaL3z2bSuYjAHrZcjHEvc/VwtrhHERbLo
         ue7sJ7l+PyioOn7m+IaEqkFKZ3DLwsKAI6VC5mXKPH47LFP16/RymgqZ8AF7HXUfbLf4
         cnl4NL2sqxVxREq9JBCUrPsT//5jXHzNzGIFF2ZF1FvS63jnBHKc2GsjN1JtQ7Ok8ZaB
         kUjItFrAiSZo+Nn/J/CuzgqcmmmYJE0bOGdkP7YkQkiPG1FjXpRqld89ewF2uWMxD8BP
         z+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764901001; x=1765505801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yWuRmLeNcvfLPbQJ5qeNcNYIaKTZlD00V+D24Ngr388=;
        b=gzBDjxeIiOCPL9znNWRmlhJfruiVlT628hYrp+U1QgyJBvoFoM9IuLVOPf9iJrlUQJ
         W8OReJjz+IX5+hcXnySC0eTdAfrNhtzMl34wC4flGbx97CtdbdngRb3CuAp+1gPEECb8
         0AXeGEmdoNJ6VkZG8vBdYRooEKEOaVzUFefYWRrVv9cqxvhykhriO5lyeXTXc8NS8CG2
         jt5Ra24Zl7OWoKTfXbHLSjMruPQ3GLnHepqMSnhSWTx4uazbYkrMndEeJ9oW1/SQhfZj
         9IItleHvJNRPUxY/4aI3ohwiuf/qubOf4EYfW0jNc5IsVQGN2S/p4THADp3lsv4Z46zV
         BYPw==
X-Forwarded-Encrypted: i=1; AJvYcCVJZMyBG1ZUQhsTjoADaiHQJZsC3M5VmWPlkFWmk0hyN8Pp/6drRzmaW7aO9yDnQfr4tKoKLtFwbgwojw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJrMzxfonQpV9jmcSk0rjhWSu2C1CptlWtXny3T/Fx1xZ0hsyb
	YfB616+vmGiNL9cFT1P+/4pRJ4UpA9Qs3pC9TCIrZgN4bA/2DWonUYmX
X-Gm-Gg: ASbGncvj8hRoZAEsWZQUwAlIm3pVHUsUKUFmNF+UPcJwlJett94x9txeIDAolHb2+vl
	ilaEbX67NgGPkCiaqUmwOqmpBHNTvIn26iIVnIp+UW53nDreU+6VpbsailA74Rb6emv5y5ezecz
	N606cluCyJ8LlJ6OmyC1DaWNxshwSWCvIcu3IuOBMgTou8UZRJ3pcfqFzPhjSIH1YaJ5DGmuWFj
	fe9ruVmBTalutj5UjzaIHMhlc/0ZHBXX/xppRa9QT6JXV6D/GgJ+EJL9Ws9ZjBzJc7mfiLa49y/
	QbvC+cqjUAcampfPzpd1zG8qujlk9V24BrsDYA73KZak/A63nE9eo1cCbaWLNYyHknAxQLps8bH
	xsQ5sFsJKfDmC4bUsruhudtG0AL+0a0PT0xRuDKwwQMffzU+hs1zIEDO9PQGWy1fWrUf2RZv+5w
	ld6geuW/Se
X-Google-Smtp-Source: AGHT+IEyFEkOELgyiHNROdiStkgWh5vG+sTc4f93bdHueEVTwDFr+UEZX+prSlamxC/7wi7A40g+fA==
X-Received: by 2002:a05:6512:39d2:b0:594:b2be:f3a with SMTP id 2adb3069b0e04-597d66c816amr1719792e87.25.1764901000513;
        Thu, 04 Dec 2025 18:16:40 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-597d7b24862sm999822e87.29.2025.12.04.18.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 18:16:39 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: andriy.shevchenko@linux.intel.com
Cc: Dell.Client.Kernel@dell.com,
	bartosz.golaszewski@linaro.org,
	benjamin.tissoires@redhat.com,
	dmitry.torokhov@gmail.com,
	linux-acpi@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	regressions@lists.linux.dev,
	rrangel@chromium.org,
	superm1@kernel.org,
	wse@tuxedocomputers.com
Subject: Re: [REGRESSION][BISECTED] Dell Precision 7780 wakes up on its own from suspend
Date: Fri,  5 Dec 2025 05:16:16 +0300
Message-ID: <20251205021616.1570442-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <aRDml95nMPeknmUM@smile.fi.intel.com>
References: <aRDml95nMPeknmUM@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Andy Shevchenko <andriy.shevchenko@linux.intel.com>:
> > Sounds like it comes via GPIO, but it's not handled as touchpad IRQ. You may
> > try to add a quirk to prevent touchpad IRQ from waking the system. That should
> > help I believe.
> > Something like "ignore_wake=INTC1085:00@355" in the kernel command line.
> > If it helps, update drivers/gpio/gpiolib-acpi-quirks.c accordingly.
> 
> It might be actually the touchpad controller name (as I see in the quirk table):
> 
> 	ignore_wake=VEN_0488:00@355

It worked!

First, there is no option "ignore_wake". Correct option name is "gpiolib_acpi.ignore_wake".

I tried "gpiolib_acpi.ignore_wake=INTC1085:00@355", and it didn't help.

I tried "gpiolib_acpi.ignore_wake=VEN_0488:00@355", and it did help!

Please, somebody (maybe Mario?) author a patch.

Thank you in advance.

-- 
Askar Safin
