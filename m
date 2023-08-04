Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7691C14A
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 16:28:38 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-791c27bb91dso1518611241.0
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 09:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691166517; x=1691771317;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CmP6zS1uXQ/K4lwCiJguuc04GVnNi9A4y0catAtEmbc=;
        b=sW9yq5KzPS0L46lWKz5VGV38bjUrHawEujFHjlMsubd/4Hqs3gHprOmO4gNbRr5D9j
         bF14WYricFRhWf0RpG7+XjtjygcHTfFEA5NAXecROdNgaMMVevu1CBZfZmnKV4tbVtSI
         3biRnPq6hyMii/k8zEj6YNUBeOWrhTWHVYjBcS9Q9KoJYS0gEemky9i14HCPVj8c90Gj
         tpDxYLUGTg3z8ImpwN4ERkgGoG/gvUa7ZuvIKpLyndXieNsNunV6JM58UxK8RJ+93xM4
         KnJMdzrBQXcGsI4sVicBtIqKlggrB5jDoIRhBzVUeZDo+hBCXfOuqvrP4k9SsE0S89HS
         Dp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691166517; x=1691771317;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CmP6zS1uXQ/K4lwCiJguuc04GVnNi9A4y0catAtEmbc=;
        b=GdkTLvQNI9bsImKgq1O1J2MTMCCbaKGJInDdgRcCU9YfqTG8JbJhdXamjaLhQ0FIR9
         b8cKdS98Zf5u3PgHVmikcMi7elEVEw6KN6ecMdhyHDEciJTBSm7aKprABJ1ceyAIgRBV
         TTzAYkCa8uypdiG3ww+UUCi8Tdpov5TCLzMydzVnvb+wFnFDx1jsTG9bqSeWEMorfQjb
         /q+TqbCaEq5KHXbgtmPynrUWGO6ZK+V4x2ISTW7dyWkn2WumwdJLcV5qrqV5jfeTv9oF
         sbi38MdrscrDp+upTQNlqa8aaABXQ1swAGRliQw3tyod50fHa5xk1Ri+86pf2M7CYw5j
         D0ew==
X-Gm-Message-State: AOJu0Yz+9yG8x4XR28blAMlcX9NanM72dxlAyvKP6qneNKBh80sSSl6n
	fy/lGTzvhMoK/QKMuvUSbRLgAG4tTgrhR5PZRn2PMA==
X-Google-Smtp-Source: AGHT+IHtQ9SnoRs+JPYtT5RMH212OiXnM2yKMpz4zFAz0pvLJ97XKzr3dhy2e6GbNWkDQAh9094YSIW9rpR1kW4fGuk=
X-Received: by 2002:a05:6102:3127:b0:447:c2f5:ee09 with SMTP id
 f7-20020a056102312700b00447c2f5ee09mr134792vsh.2.1691166517567; Fri, 04 Aug
 2023 09:28:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Fri, 4 Aug 2023
 09:28:37 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
References: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
 <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com> <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
Date: Fri, 4 Aug 2023 12:28:37 -0400
Message-ID: <CADyTPEwvxrEUnHtMq==nUC7ai8AR-N_1CHXErkQo4Pbfcx0OKQ@mail.gmail.com>
Subject: Re: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On 2023-08-04, Nick Bowler <nbowler@draconx.ca> wrote:
> As far as I can see, this is supposed to be handled by the code in
> drivers/reset/zynqmp-reset.c driver, it is enabled by CONFIG_ARCH_ZYNQMP,
> and I have that set to "y", and it appears to be getting compiled in (that
> is, there is a drivers/reset/zynqmp-reset.o file in the build directory).

Correction: I typed zynqmp-reset.c but file is actually reset-zynqmp.c.

Cheers,
  Nick
