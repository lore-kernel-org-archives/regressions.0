Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC06E28E7
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 14:53:48 +0000 (UTC)
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-58ee4df08fbso63766167b3.3
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 07:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693320827; x=1693925627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky3d8D5ymMbIfBXVq+qxATqRkOwyZi9DsKmup3PNcMU=;
        b=Ua0W/oI31W8kUh/mHh4BdS2E2RdrGmHy0OtqHOz3gXV1Lahp9Dxfake9juOgfTiG0j
         2ylXmDJDrNLcCvXlhi0Ke44vP9K4tguMaJIzzR9FChgoEgrtVtxElPY/VOauMk7LQaKQ
         smLj8bZ67HFSY23UOiZ1KPNqEfchppKoat9VY6sZu7zpGwxwzEBpwfHkIAwWfAOPLqQh
         2osGf4wqHydez1ufUZx+diQuoyuGYIq2Cimkx9JlNLAsfA5XEBhoOfOha0cdyKbFmXDu
         RWK8ALjcrH2QRu3Vm9+n3DqK8+ws1LNaRPr2y6qF6dZUaKckPD1Bb8kgQ21n40LSyu9q
         A+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693320827; x=1693925627;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ky3d8D5ymMbIfBXVq+qxATqRkOwyZi9DsKmup3PNcMU=;
        b=LikemliANNMbg5jc60KEhtCkzejyIKwIId1qC0X/6euzZSjYm9i5FLYdP6i6ovQ3T3
         vXrNWApDKk0OLRfKk3vCSY61mmXtULwonqsXtG6qNfyqysBNbeJKbUfxN3xXFZHgP+IF
         xmwfAJLfCaCumU9vqcglNvXywRJFoZvp/5LUiJIv7ap4iv3DWd0bLTusLIyMf6C7FGNB
         pgoMkjYqonXh54hyH9c0SunzF39xSy/RwAm5ZG1HQHmwqVq++eb7QmrvMX3EKbMgoKPI
         EfV5OkkyGzYqDfIWaOrHKcIhFp9Sa+c4tB2tB/qUCw80rFdnLcUYWPwnmfLerNsDKqpc
         v9hQ==
X-Gm-Message-State: AOJu0Yw3M1QwTDxvxyGPG0XEAhi/4orDDchBG2FvV72ZO31hNZrA3R5g
	TQF5xOWATcroPCV0hQfArXryLJ9cYuU=
X-Google-Smtp-Source: AGHT+IFUIM4+6E0xyUCXjdjIabWpHNkXAnpnYs2UsN4bcqdefeenkaN9AY+O7fjrvHm1zce80Y3CwZ5v41w=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a5b:991:0:b0:d07:9d79:881c with SMTP id
 c17-20020a5b0991000000b00d079d79881cmr979102ybq.11.1693320827774; Tue, 29 Aug
 2023 07:53:47 -0700 (PDT)
Date: Tue, 29 Aug 2023 07:53:45 -0700
In-Reply-To: <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <ZO2RlYCDl8kmNHnN@torres.zugschlus.de> <ZO2piz5n1MiKR-3-@debian.me>
 <ZO3sA2GuDbEuQoyj@torres.zugschlus.de>
Message-ID: <ZO4GeazfcA09SfKw@google.com>
Subject: Re: Linux 6.5 speed regression, boot VERY slow with anything systemd related
From: Sean Christopherson <seanjc@google.com>
To: Marc Haber <mh+linux-kernel@zugschlus.de>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, linux-kernel@vger.kernel.org, 
	Linux Regressions <regressions@lists.linux.dev>, Linux KVM <kvm@vger.kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Aug 29, 2023, Marc Haber wrote:
> [Please keep me on Cc, I am only subscribed to linux-kernel]
> 
> Hi Bagas,
> 
> thanks for your quick answer.
> 
> On Tue, Aug 29, 2023 at 03:17:15PM +0700, Bagas Sanjaya wrote:
> > In any case, bisecting kernel is highly appreciated in order to pin down
> > the culprit.
> 
> Without having read the docs (that came too late, need to read up on
> that again), my bisect came out at
> 84a9582fd203063cd4d301204971ff2cd8327f1a being the first bad commit.
> This is a rather big one, that does not easily back out of the 6.5
> release. Sadly, just transplanting drivers/tty/serial from a 6.4.12 tree
> doesn't even build. I'm adding Tony Lindgren, the author of the commit,
> to the Cc list.
> 
> But, since the commit is related to serial port, I began fiddling around
> with the serial port setting on the misbehaving VM and found out that
> running the VM without the serial console that I am using (thus removing
> "console=ttyS0,57600n8" from the kernel command line) makes the machine
> boot up just fine with the 6.5 kernel that I built yesterday. It is not
> even necessary to remove the virtual serial port.
> 
> The issue is still somehow connected to the host the machine is running
> on, since my VMs all have a serial console and the test VMs running on
> different hosts are running fine with 6.5.

What is different between the bad host(s) and the good host(s)?  E.g. kernel, QEMU,
etc.
