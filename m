Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D37486E9
	for <regressions@lists.linux.dev>; Tue,  6 Sep 2022 20:10:38 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso7644572pjd.4
        for <regressions@lists.linux.dev>; Tue, 06 Sep 2022 13:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date;
        bh=9Td8XpGUYGMQ1ztn2ab03NOmJkL81G2Vr9SzpEsLe8c=;
        b=Syh6qYGXPF1+iXWMWdTe//lloZ4aytk7hRROJjaD0T7IZ4sxQ5FZzvkfGiHDmiqsmp
         8dyvavm7cDYn5aKHfkjaor7tejxYcj6EPQbZtfapaXst82kJNcNuA7nAIZfJNTE8nOnm
         nTOcZAcyNegEUGO7Hvryv1vknaRJj49EZG9v/K/dz4S/UVpyWh32dVtKkh2dYGxIrdh3
         LDjglxk5Z1s/x5kg2MRo5Cjm+WrFVrc6rcKUloCvgnfA37wbbITpCcEpKDsuvxV73tlQ
         Yk3XwS9RH3NrZDQShKEw3ilvNGv3JlPn+7fXcJW/k9VH3sTvTdeXUHv0HV7JJH7AbSjf
         qiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date;
        bh=9Td8XpGUYGMQ1ztn2ab03NOmJkL81G2Vr9SzpEsLe8c=;
        b=dZUiz/UJG+jR4piqMUvsovClG9Z/OUtRmOJwsU0+3QIzUFaQ50OD23X9Eaq+smOWxH
         S+ft62RI310yrEJqABnczZ4LvZRorCNobIXCCa0QerVfv2rusCtKs+YoZwDmTReJrqsX
         xD3qbjFMxsv1mc6TWCeKppk/E86G3pdqrUsVuDkLn8QzOpxqYQGfuTjHBK1Du6WN8uox
         MdVlToeO0ehbQSNepkP7PrPOWnOIWBiSHYwbM453vMHRr6GNl9qnUJq/yWdGION98kIM
         8wd1tFaqvVQ2ygnDhdxidBXb3ogfym9tlI4WHIxTDiQIeB4lkle5ItHmYNFyoo77rVr+
         BO+A==
X-Gm-Message-State: ACgBeo1aRNgz5VlYCaw+G+vguwP6kbfptviJcpur+s+FHDpnPtVz8B+H
	RV/hNayF4YzWaf6i/jb70b8=
X-Google-Smtp-Source: AA6agR6SCB0hkPZtWwhbWCeEXIrP2/VUlmccYhvDsSbxMoIhQI21C5+BOIe+0ZFFwTXNOCwfQPzZJA==
X-Received: by 2002:a17:90b:3b4d:b0:1fe:4d47:76ed with SMTP id ot13-20020a17090b3b4d00b001fe4d4776edmr27222457pjb.150.1662495038393;
        Tue, 06 Sep 2022 13:10:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 21-20020a170902c11500b001714c36a6e7sm4144764pli.284.2022.09.06.13.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:10:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 6 Sep 2022 13:10:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Christopher Klooz <py0xc3@my.mail.de>
Cc: eugene.shalygin@gmail.com, linux-hwmon@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other
 distributions
Message-ID: <20220906201035.GA3453623@roeck-us.net>
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de>

On Sat, Sep 03, 2022 at 01:00:33PM +0200, Christopher Klooz wrote:
> Hi Eugene,
> 
> Currently, we have user reports of at least 4 Fedora installations that have
> issues with asus_ec_sensors since 5.19.4. They remain in 5.19.6.
> 
> All issues can be solved by blacklisting asus_ec_sensors.
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=2121844
> 
> The bugzilla report contains kernel logs of two machines, one with
> nvidia-driver and one without a tainted kernel.
> 
> The report and the contained ask.fedora link contain some elaborations of
> how the issue manifests at the users' machines. The major issue is a wrong
> output of battery power percentage (in one case it gets stuck, in the other
> cases is becomes erratic). Also, in one case it has effects on suspending
> (see the report).
> 
> On the Internet, there are already reports from other Linux distributions
> noting the issue and the same solution (blacklisting).
> 
> Thanks for maintaining & regards,
> 

Are we getting any closer to fixing this problem ? If not, I'll have to start
reverting patches or even declare the driver as BROKEN.

Thanks,
Guenter
