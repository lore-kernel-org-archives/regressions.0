Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7E086EB
	for <regressions@lists.linux.dev>; Tue,  6 Sep 2022 20:23:20 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id l16so6580584ilj.2
        for <regressions@lists.linux.dev>; Tue, 06 Sep 2022 13:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dFUtGD2CYSZCPlkfNLuOvYXYPqX89V5HFliBFkygvhw=;
        b=IJMZ0ssNnxQMP4S9bMps8AveY/BpJyiQTTtJCLZgfQmxK2Joxpl83mMrw8qwM3GfML
         I8UHTcDnG4R/bmhlIVbv/fQEHcx2/qe/4tnxKHQtTWSOVWNEMiT7tV4Kx5yyst6K1m1W
         lBSCR/4tlBTewGLQwxbd5/cZOJ1UjUdDetiVjAao9HfD5YFvpydBzpzx5rK2/EMg35Ic
         4QuXon4nO0zTIzMbTDw6jeQvL1QPhIojr+mrfrK5t73pcL3Cy9tIARsNZnJQY8SJipPN
         MnMHs4lt175pS7pyun+MLy1rTlg8e8ZA1YirvTwoyOXRTLSJ37tNJqqgC3R5xG2P3aIa
         XLtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dFUtGD2CYSZCPlkfNLuOvYXYPqX89V5HFliBFkygvhw=;
        b=tqkClZ1xdXd2bpSbykCtUNl1DV0JaXqmznPBBQ1vmc+Ip5ah5rrvYTdm3LO11zxFku
         osqA6hti4lCQThsOW7C0JM2uK/l9YrUHMJi/VMVADjJzn/G1ZUU9SCwQ8FrGUWdHLdhL
         U0payuSaA6d7Y0Q0Va6t14Tbqjn5sTnWKPZ+r8dYLsa1y9NGnOW1Fu3GjVMBeM0vKbr6
         Q3djxIm7e/YBKfwr/NKIdefOcZvUSFL22a/utBvLY+guBfMUL7DEGy8ZD+oE3SAT0LgF
         c+y2gLlNr5mF2LvTuC1NZSDqtUK69wlsBjrzmRWnEr6zIKaZWM7tZRgNNMLOUqVFKTEU
         abiA==
X-Gm-Message-State: ACgBeo03BcXIOoOcX6vW5R+Tp11+1EjbwVg30RwK6lI4va9uUcJPHGJb
	puNKOxv4EwZVDeVne45T6L3O/IHi0s/WM+AXmFA=
X-Google-Smtp-Source: AA6agR7Vb4ipPmzyR9ULsjjEpzV4TmM/HpiMiHikkCKNEoBfZGjbHsYMM1JBK9rPo8CijSdjKQXyO2SwJkYn5LW+6V4=
X-Received: by 2002:a05:6e02:1bc9:b0:2f1:9ee8:246d with SMTP id
 x9-20020a056e021bc900b002f19ee8246dmr146712ilv.246.1662495799666; Tue, 06 Sep
 2022 13:23:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <20220906201035.GA3453623@roeck-us.net>
In-Reply-To: <20220906201035.GA3453623@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 6 Sep 2022 22:23:08 +0200
Message-ID: <CAB95QAQRT5p5k=0D781aOra9uF3vw-92+T_CePd_7tzJDDH0Yg@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Sept 2022 at 22:10, Guenter Roeck <linux@roeck-us.net> wrote:
> Are we getting any closer to fixing this problem ? If not, I'll have to start
> reverting patches or even declare the driver as BROKEN.

Out of a few workarounds I've tried, none worked. I rework the module
autoloading back to plain dmi data. Sorry, I'm totally busy until this
Friday and can't prepare a patch until the end of the week. If that is
too late, removing just the module autoloading
(MODULE_DEVICE_TABLE(acpi, ...)) will fix the problem.

Regards,
Eugene
