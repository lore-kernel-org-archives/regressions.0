Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE962F23
	for <regressions@lists.linux.dev>; Sun,  4 Sep 2022 13:19:44 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id n202so5136635iod.6
        for <regressions@lists.linux.dev>; Sun, 04 Sep 2022 06:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1Z50Lfymh1PlbkiwBA/PwOqZtMKxrfRNBW2U0b3NRB4=;
        b=jPYqbT91EXpvabefP4wXgkLu3BSFHcinWtR5ZSBMeJ1h5sYsm/CIVkfMjQ6moOCWzL
         n3W1FmutnnvXKfJEFZ2a9tHZ7ri1mDBsq9O6qFcVnaBbCSqTyR/sZRoE5pcAhwtwcieX
         EzxP1ENUNEvj5eCze+GJfFc36tPFHYpkI4g6snbSsB/zpjqLVIDkg60S6Dk3iCmK1XR/
         Gz5Hj0JRgW70Wi797RnHdb2AkCJ0mYGaikSaH6xD/+0Ijp7RiuQaEXq/hFnWKYbmiw0E
         OXLE9jOK8lVqUtCfryuEo1YEPLXLepYivS7axZ7YvDbiWgEMSo7gbF2H2eRld5tW+rYS
         mAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1Z50Lfymh1PlbkiwBA/PwOqZtMKxrfRNBW2U0b3NRB4=;
        b=dGSrj3M7RIWAti+xVg0145WYpnpJKe68GQJclDfs4a3HXKwy0bX0tZX98+JovKODbr
         4nN7IFECqpEZuMTcLCUWPSVbFrl9p13pi3sdret22lLhrO5GVjvkQZzj5rjodKerXIa6
         IqykpJGlge/aA52kKLKahH87aEiDh9zIoKvWN0EDiknAXTcom5iwtZriK1EHROatKM0T
         oUs5eEXoku4JsLkZHpLtyyGqTtCTDzCwDtWfjcAbysvMJ8b41XNPp4E4ZlKsnviB3czQ
         rfazlBYcnHuGHEQwQXeLXecS86+BQ6OwbvcWN47i12C5g68TsVkpAEbBLjgmsYO4mMaT
         zYCQ==
X-Gm-Message-State: ACgBeo340lGqTlBRiNspJuPYh8jiVz/0NvHpzDCe44peDQtSnJpfP/3m
	vhnxz4zYNbW8Qe/hHOQZiNnIE/Q8M8WepVchdwc=
X-Google-Smtp-Source: AA6agR67SqrtMJ8xv+Xs/AipmBBhh9/S/k/SoCqE0wZRKHE2hVw1FMxFUiXPGDEtsdp4x0q6lt9ZM83xzroLgVzBDig=
X-Received: by 2002:a6b:b716:0:b0:68b:b14e:6220 with SMTP id
 h22-20020a6bb716000000b0068bb14e6220mr13049361iof.133.1662297583436; Sun, 04
 Sep 2022 06:19:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6026b5e2-a8f5-1058-6112-f191bde333a6@my.mail.de>
 <47e41e8f-f6b2-4bc7-de3f-0c811ee6fdf7@my.mail.de> <62fb8a16-bebd-5de7-0b4f-eed4d2593587@roeck-us.net>
 <CAB95QATHd1sJwbYOPeb28j9vZAfZAu-Xa+pXWUhbMTVifKz93A@mail.gmail.com>
 <5e42685d-ae82-d74d-4883-d8a9e9fcb243@roeck-us.net> <CAB95QAQ9EXX3uZhiZyxr=aAwiSR6j6i1GstFg9iX4eF06b5GUQ@mail.gmail.com>
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net> <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
 <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
In-Reply-To: <2f14746c-8051-b711-cd28-7ca521d21c4d@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 4 Sep 2022 15:19:32 +0200
Message-ID: <CAB95QARMOq0ie0SmhRx73L=mptTaa-eEHfNjGRH5CXvVFh-RLw@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Sept 2022 at 01:47, Guenter Roeck <linux@roeck-us.net> wrote:

> A driver with a probe function can be unloaded and reloaded manually.
> I don't see how you can do that if the functions are marked __init
> and the driver is built into the kernel.

Did that and a user tested those changes. Unfortunately, the ACPI EC
is still inoperational if a module uses the ACPI id of the EC device
and its probe function returns an error. Looks like I have to change
MODULE_DEVICE_TABLE completely.

Regards,
Eugene
