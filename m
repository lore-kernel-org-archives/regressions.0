Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC6C7D72
	for <regressions@lists.linux.dev>; Sat,  3 Sep 2022 22:37:41 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id b142so4391501iof.10
        for <regressions@lists.linux.dev>; Sat, 03 Sep 2022 15:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VG4WdCRTKsnUl8DU++AAwbVOVF3DpGRyvXwvrmGK6oA=;
        b=pQeJQuP2nXfb0+sReafFsUZaOcsbp+inidtF93HkRXkV2hDDIRDL+jcyE6mSJJORbH
         TwK68BzQAdPTsKl/0k9+sOG3Vu/tHUzxCCHpSJyxmQLDC5ldZtGpqLVJ9cRp3Fc+Syt0
         +0NW/QPecJ0e6fOsrog2K/ozECF+1WLc+nCewjFMT4wgwNbHX3WWwd9PbXRC3pkLx1z8
         wVPKGnvpR064v62Q6oOsN2qlksoABCuSdfyVJdVe2waeAlDGCk1NhY7ZSfZUaUJUrPRL
         vrpibt3U/JyMhzSHm0dHvCA8rXyo3ajymwq+xy2dA7CQu1F/OUGfjuC50LBBZkqt3lxS
         yIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VG4WdCRTKsnUl8DU++AAwbVOVF3DpGRyvXwvrmGK6oA=;
        b=uhDrM7k+g8RmLufsUd8ss13F0u1U+kc212pThvQVmEhWIf2Dm/C1tMPg3PUtdZ3Xpj
         xYJwEIG1VDF2N16wujEwG++P5AK/fxzOtDcMbhKRk1j7fNojqAW22LLM6TQfe4ZoPrBe
         zTKQB8PoQ3qm7r/eLnCzokWAWraXntamcelKY7UjI7JjvqaVSnOoMuvwawwyBthLHWAO
         TUSjCnW2TPN8ZBrqATthuMsiZ5jiwaNjZ25VwwjuRK7lNpGHjMSUDPxJbVzOBMOFi7DW
         vxS7QHuWk+8ujoFg1RLi9B8fdCfSU5kTX/s4k8EqxAA+gSmcPAVeWo0eAk7qSHs7fenW
         qOqQ==
X-Gm-Message-State: ACgBeo22naGKXU/sykyPtrhw7f8MNredkzw45/TdqffDP0dhBGvnB92F
	7SOrCX1xp2oFZrtPoiD21hqdap6zV0HfwvEUSCw=
X-Google-Smtp-Source: AA6agR6SnB6cO1ifmtXXYnCDdd9ICvZ3HAoKwlUo3SzdXMb+RTmlbN2PKYQIJxHMHHm/nyWwVeB/P52/M+h1JFprFnY=
X-Received: by 2002:a05:6638:1396:b0:350:1059:29bb with SMTP id
 w22-20020a056638139600b00350105929bbmr3292827jad.67.1662244660593; Sat, 03
 Sep 2022 15:37:40 -0700 (PDT)
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
 <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
In-Reply-To: <ac202c2e-3add-2470-3fa6-85783c1494a0@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Sun, 4 Sep 2022 00:37:29 +0200
Message-ID: <CAB95QAT=x8V7yg70azPnnD=Hv70goQbA6S8fOVjRpsvKfcK8Ww@mail.gmail.com>
Subject: Re: Issue in asus_ec_sensors in Fedora installations and other distributions
To: Guenter Roeck <linux@roeck-us.net>
Cc: Christopher Klooz <py0xc3@my.mail.de>, linux-hwmon@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sun, 4 Sept 2022 at 00:00, Guenter Roeck <linux@roeck-us.net> wrote:
> What does the name of the struct platform_driver data structure
> have to do with __init ?

That's what the modpost warning message suggests:
WARNING: modpost:
/home/eugene/develop/asus-ec-sensors/asus-ec-sensors.o(.data+0x60):
Section mismatch in reference from the variable
asus_ec_sensors_platform_driver to the function
.init.text:asus_ec_probe()
The variable asus_ec_sensors_platform_driver references
the function __init asus_ec_probe()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console

Regards,
Eugene
